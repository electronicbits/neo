require "aws-sdk"

task :upload_github_secret do
    #uses parameter store to upload the github secret
    puts 'uploading github secret to parameter store'

    ssm_client = Aws::SSM::Client.new()

    ssm_client.put_parameter(
        name: 'github-access-token',
        description: 'github access token',
        value: '<insert-the-github-access-token-here>',
        type: 'SecureString'
    )

    puts 'Secret uploaded'
    puts "Loading secret and printing value to make sure upload worked:"

    value = ssm_client.get_parameter (
        name: 'github-access-token',
        with_decryption: true
    )
    puts value.parameter.value

end


# PS.delete_parameter method
def delete_parameter(parameter_name)
    client.delete_parameter(
      name: parameter_name
    )
    puts "Parameter #{parameter_name} was deleted.\n"
end

#https://github.com/devops-dude/aws-parameter-store