require 'autostacker24'
require_relative 'logger/Logger'

module Neo
    class PipelineDeployer

        def initialize()
        end
        
        def deploy_pipeline(pipeline_file_location, parameters, stack_name, tags)

            Logger.debug 'Deploying codepipeline cloudformation...'
            # puts 'Deploying codepipeline cloudformation...'

            Stacker.create_or_update_stack(
                
                # stack_name, 
                # template, 
                # parameters, 
                # parent_stack_name = nil, 
                # tags = nil, 
                # timeout_in_minutes = DEFAULT_TIMEOUT, 
                # role_arn: nil


                @stack_name, 
                pipeline_file_location, 
                parameters,
                nil,
                nil,
                tags)

        end
    end
end