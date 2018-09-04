require 'autostacker24'

module Neo
    class PipelineDeployer

        def initialize()
        end
        
        def deploy_pipeline(pipeline_file_location, parameters, stack_name, tags)
            puts 'Deploying codepipeline cloudformation...'

            Stacker.create_or_update_stack(
                stack_name, pipeline_file_location, parameters, tags)

        end
    end
end