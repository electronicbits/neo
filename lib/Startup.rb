require 'yaml'
require 'fileutils'
require 'aws-sdk'
# require 'autostacker24'
require_relative 'models/ConfigModel'
require_relative 'PipelineGenerator'
require_relative 'PipelineDeployer'

module Neo
    class Startup

        def initialize()
            @genesis_template_file = "templates/genesis.erb.yml"
        end

        def run(pipeline_file, result_file_location, branch)
            
            pipelineFileLocation = File.join(File.dirname(__FILE__), pipeline_file)
            puts 'the pipeline file is located here...'
            puts pipelineFileLocation

            parsed_pipeline = YAML.load_file(pipelineFileLocation)
            p parsed_pipeline.inspect # will print the file name

            #load parsed file into model
            configmodel = Neo::ConfigModel.new(parsed_pipeline)

            # puts configmodel.codeRepo.user
            pipeline_generator = PipelineGenerator.new
            result_file_location = pipeline_generator.create_pipeline(configmodel,
                @genesis_template_file,
                result_file_location,
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

            stackName = 'test-stack'

            pipeline_deployer.deploy_pipeline(
                result_file_location,
                parameters,
                stackName,
                tags)

        end
    end
end