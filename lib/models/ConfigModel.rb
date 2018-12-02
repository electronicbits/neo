require_relative 'CodeModel'
require_relative 'BuildModel'
require_relative 'StepsModel'

module Neo
    class ConfigModel
        attr_accessor :codeRepo
        attr_accessor :build
        attr_accessor :steps

        def initialize(options)
            @codeRepo = Neo::CodeModel.new(options["code"])
            @build = Neo::BuildModel.new(options["build"])
            @steps = Neo::StepsModel.new(options["steps"])
        end

        def get_binding
            binding
        end
    end
end