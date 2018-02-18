require 'yaml'
require 'models/ConfigModel'
require 'FileUtils'
require 'PipelineGenerator'

module Neo
    class Startup
        
        def parse(pipeline_file)
            pipelineFileLocation = File.join(File.dirname(__FILE__), pipeline_file)

            parsed_pipeline = YAML.load_file(pipelineFileLocation)

            p parsed_pipeline.inspect # will print the file

            #load parsed file into model
            configmodel = ConfigModel.new(parsed_pipeline)

            # puts configmodel.codeRepo.user
            pipeline_generator = PipelineGenerator.new(configmodel, "templates/test.erb.yml")
            pipeline_generator.create_pipeline
        end

    end
end