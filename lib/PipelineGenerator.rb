require 'erb'
require 'yaml'

module Neo
    class PipelineGenerator
        
        attr_reader :model
        attr_reader :template_location
        attr_reader :branch

        def create_pipeline(model, template_file_location, branch = null)
            puts "Creating codepipeline cloudformation ..."

            @model = model
            @template_location = template_file_location
            @branch = branch || "master" #defaults to master

            templateFileLocation = File.join(File.dirname(__FILE__), @template_location)
            templateString = File.read(templateFileLocation)
            
            template = ERB.new(templateString, nil, '-')
            result_file_content = template.result(model.get_binding)

            template_as_hash = YAML.load(result_file_content)
            return template_as_hash
        end
    end
end