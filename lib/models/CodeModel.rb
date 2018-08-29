module Neo
    class CodeModel
        attr_accessor :user
        attr_accessor :repository
        attr_accessor :codeHost     # github, bitbucket, codecommit ?
        
        def initialize(options)
            @codeHost = options["codeHost"]
            @repository = options["repository"]
            @user = options["user"]
        end
    end
end