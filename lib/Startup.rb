require 'yaml'
require 'fileutils'
require_relative 'models/ConfigModel'
require_relative 'PipelineGenerator'

module Neo
    class Startup
        def parse(pipeline_file, result_file_location)
            pipelineFileLocation = File.join(File.dirname(__FILE__), pipeline_file)

            parsed_pipeline = YAML.load_file(pipelineFileLocation)
            p parsed_pipeline.inspect # will print the file

            #load parsed file into model
            configmodel = Neo::ConfigModel.new(parsed_pipeline)

            # puts configmodel.codeRepo.user
            pipeline_generator = PipelineGenerator.new
            pipeline_generator.create_pipeline(configmodel, "templates/test.erb.yml", result_file_location )
        end
    end
end