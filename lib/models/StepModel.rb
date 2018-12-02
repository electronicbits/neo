module Neo
    class StepModel
        attr_accessor :do_wait
        attr_accessor :do_block
        attr_accessor :label
        attr_accessor :command
        attr_accessor :buildType
        attr_accessor :buildComputeType
        attr_accessor :buildImage
        attr_accessor :artifacts_path

        def initialize(options)
            @do_wait = !options['wait'].nil?
            @do_block = !options['block'].nil?
            @label = options['label']
            @command = options['command']
            @buildType = options['buildType']
            @buildComputeType = options['buildComputeType']
            @buildImage = options['buildImage']
            @artifacts_path = options['artifacts_path']
        end
    end
end