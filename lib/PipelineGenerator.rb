require 'erb'

module Neo

    class PipelineGenerator
        
        attr_reader :model, :template_location

        def initialize(model, template_file_location)
            @model = model
            @template_location = template_file_location
        end

        def create_pipeline
            puts "creating codepipeline cloudformation"

            templateFileLocation = File.join(File.dirname(__FILE__), @template_location)
            templateString = File.read(templateFileLocation)
            template = ERB.new(templateString, nil, '-')
            result_file = template.result(model.get_binding)

            file = Tempfile.new("pipeline-cloudformation.yaml")
            uniqueFilename = File.expand_path File.basename(file.path)
            puts uniqueFilename
            file.close

            puts "Writing down pipeline result file (cloudformation)"
            File.write(uniqueFilename, result_file)
        end

    end
end