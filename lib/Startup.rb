require 'yaml'
require 'fileutils'
require 'aws-sdk'
require_relative 'models/ConfigModel'
require_relative 'PipelineGenerator'
require_relative 'PipelineDeployer'

module Neo
    class Startup

        attr_reader :genesis_template_file
        attr_reader :branch

        def initialize()
            @genesis_template_file = "templates/genesis.erb.yml"
        end

        def run(pipeline_file, result_file_location, branch)

            @branch = branch || "master" #defaults to master
            
            

            pipelineFileLocation = File.join(File.dirname(__FILE__), pipeline_file)
            puts 'the pipeline file is located here...'
            puts pipelineFileLocation

            parsed_pipeline = YAML.load_file(pipelineFileLocation)
            p parsed_pipeline.inspect # will print the file name

            #load parsed file into model
            configmodel = Neo::ConfigModel.new(parsed_pipeline)

            puts "Config settings:"
            puts "Using branch : #{@branch}"
            puts ""

            # puts configmodel.codeRepo.user
            pipeline_generator = PipelineGenerator.new

            pipeline_hash = pipeline_generator.create_pipeline(
                configmodel,
                @genesis_template_file,
                branch)

            #deploy genesis pipeline using autostacker
            pipeline_deployer = PipelineDeployer.new

            #TODO: generate list of tags
            tags = [
                # { "Key": "ApplicationName", "Value": "TheNameOfTheApp"}
            ]

            # read github token from parameter store            
            ssm_client = Aws::SSM::Client.new()
            
            result = ssm_client.get_parameter(
                name: "github-access-token",
                with_decryption: true
            )
            token = result.parameter.value

            parameters = [
                {
                    parameter_key: "GitHubToken",
                    parameter_value: "#{token}"
                }
            ]

            stackName = "neo-codepipeline-#{configmodel.codeRepo.codeHost}-#{configmodel.codeRepo.repository}-#{@branch}"

            pipeline_deployer.deploy_pipeline(
                pipeline_hash,
                parameters,
                stackName,
                tags)

        end
    end
end