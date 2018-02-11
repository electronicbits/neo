require 'yaml'
require 'model/ConfigModel'
require 'FileUtils'

module Neo
    class ConfigYmlParser
        def initialize     
        end
        
        def parse(filename = './lib/cli/apps.yml')
            
            raise(ArgumentError, "File does not exist! (#{filename})") unless File.exist? filename

            parsed_file = YAML.load_file(filename)

            puts parsed_file.inspect

            #TODO load parsed file into model
            # configmodel = ConfigModel.new
            
        end

    end
end