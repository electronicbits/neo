require 'erb'

module Neo
    class PipelineGenerator
        
        attr_reader :model
        attr_reader :template_location
        attr_reader :branch

        def create_pipeline(model, template_file_location, result_file_location, branch)
            puts "Creating codepipeline cloudformation ..."

            @model = model
            @template_location = template_file_location
            @branch = branch || "master" #defaults to master

            templateFileLocation = File.join(File.dirname(__FILE__), @template_location)
            templateString = File.read(templateFileLocation)
            template = ERB.new(templateString, nil, '-')
            result_file_content = template.result(model.get_binding)

            puts "Writing down pipeline result file (cloudformation)"

            if result_file_location.nil?
                file = Tempfile.new(["pipeline-cloudformation",".yml"])
                uniqueFilename = File.expand_path File.basename(file.path)
                puts "temporary unique filename is #{uniqueFilename}"
                file.close

                File.write(uniqueFilename, result_file_content)
                return uniqueFilename
            else
                File.write(result_file_location, result_file_content)
                return result_file_location
            end
        end
    end
end