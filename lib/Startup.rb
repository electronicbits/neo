require 'yaml'
require 'fileutils'
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

            parsed_pipeline = YAML.load_file(pipelineFileLocation)
            p parsed_pipeline.inspect # will print the file

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

            #TODO: need to read parameters from secrets repository
            params = {
                GitHubToken:  <none>
              }
            pipeline_deployer.deploy_pipeline(result_file_location, parameters)

        end

    end
end