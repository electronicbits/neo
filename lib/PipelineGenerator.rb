require 'erb'

module Neo

    class PipelineGenerator
        
        attr_reader :model, :template_location

        def create_pipeline(model, template_file_location, result_file_location)
            puts "creating codepipeline cloudformation"

            @model = model
            @template_location = template_file_location

            templateFileLocation = File.join(File.dirname(__FILE__), @template_location)
            templateString = File.read(templateFileLocation)
            template = ERB.new(templateString, nil, '-')
            result_file_content = template.result(model.get_binding)

            # file = Tempfile.new("pipeline-cloudformation.yaml")
            # uniqueFilename = File.expand_path File.basename(file.path)
            # puts uniqueFilename
            # file.close

            puts "Writing down pipeline result file (cloudformation)"
            # File.write(uniqueFilename, result_file)
            File.write(result_file_location, result_file_content)
        end

    end
end