require 'models/submodels/CodeRepoModelFactory'

module Neo
    class ConfigModel
        
        # attr_accessor :codeHost         # github, bitbucket, codecommit ?

        attr_accessor :codeRepo

        attr_accessor :siteBucketName   #ie 'static-site-554433'
        attr_accessor :user             #ie 'electronicbits'
        attr_accessor :repo             #ie 'helloworld'
        attr_accessor :branch           #ie 'master'


        #if github 
        attr_accessor :gitHubToken      #TODO: check this one, as may require aditional security # secret value
        #end if

        attr_accessor :buildType        #ie LINUX_CONTAINER
        attr_accessor :buildComputeType #ie BUILD_GENERAL1_SMALL
        attr_accessor :buildImage       #ie 'aws/codebuild/ubuntu-base:14.04'

        attr_accessor :options

        def initialize(options)
            @options = options

            @codeHost = options["code"]["codeHost"]
            # @user = options["code"]["user"]
            
            @codeRepo = CodeRepoModelFactory.new(options["code"])

            # @user = options[code]
            # @codeHost = options.codeHost
            
        end

    end
end