require 'yaml'
require 'ConfigModel'
require 'FileUtils'

module Neo
    class Startup
        
        # def parse(filename = './lib/cli/apps.yml')
        def parse(pipeline_file)

            puts 'running on'
            puts __dir__
            pipelineFileLocation = File.join(File.dirname(__FILE__), pipeline_file)

            parsed_pipeline = YAML.load_file(pipelineFileLocation)

            p parsed_pipeline.inspect # will print the file

            #TODO load parsed file into model
            configmodel = ConfigModel.new(parsed_pipeline)

            
        end

    end
end