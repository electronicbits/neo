# require 'autostacker24'
require_relative 'logger/Logger'
require 'aws-sdk'
require 'yaml'

module Neo
    class PipelineDeployer

        def deploy_pipeline(pipeline_hash, parameters, stack_name, tags)

            Logger.debug 'Deploying codepipeline cloudformation...'
            # templateContent = File.read(resulting_pipeline_file_location)
            on_failure = 'DO_NOTHING'
            cf = Aws::CloudFormation::Client.new

            template_yaml = pipeline_hash.to_yaml

            resp = cf.create_stack \
                stack_name: stack_name, template_body: template_yaml, \
                parameters: parameters, on_failure: on_failure, \
                capabilities: ["CAPABILITY_IAM"]

            puts "Pipeline deployed"
            
        end
    end
end