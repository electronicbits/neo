module Neo
    class BuildModel
        attr_accessor :buildType        #ie LINUX_CONTAINER
        attr_accessor :buildComputeType #ie BUILD_GENERAL1_SMALL
        attr_accessor :buildImage       #ie 'aws/codebuild/ubuntu-base:14.04'

        def initialize(options)
            @buildType = options["buildType"]
            @buildComputeType = options["buildComputeType"]
            @buildImage = options["buildImage"]
        end
    end
end