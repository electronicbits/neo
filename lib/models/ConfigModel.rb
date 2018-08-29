require_relative 'CodeModel'
require_relative 'BuildModel'

module Neo
    class ConfigModel
        attr_accessor :codeRepo
        attr_accessor :build

        def initialize(options)
            @codeRepo = Neo::CodeModel.new(options["code"])
            @build = Neo::BuildModel.new(options["build"])
        end

        def get_binding
            binding
        end
    end
end