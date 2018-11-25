# require 'autostacker24'
require_relative 'logger/Logger'
require 'aws-sdk'

module Neo
    class PipelineDeployer

        @environment = "kaos"

        def initialize()
        end
        
        def deploy_pipeline(pipeline_file_location, parameters, stack_name, tags)

            Logger.debug 'Deploying codepipeline cloudformation...'
            # puts 'Deploying codepipeline cloudformation...'

            templateContent = File.read(pipeline_file_location)

            # puts templateContent

            stack_name = 'test-stack'
            on_failure = 'DO_NOTHING'
            # parameters_temp = [
            #     { parameter_key: 'DBName',         parameter_value: @db_name },
            #     { parameter_key: 'DBPassword',     parameter_value: @db_password }                
            # ]

            cf = Aws::CloudFormation::Client.new

            resp = cf.create_stack \
                stack_name: stack_name, template_body: templateContent, \
                parameters: parameters, on_failure: on_failure, \
                capabilities: ["CAPABILITY_IAM"]

            puts "Pipeline deployed"
            
        end
    end
end