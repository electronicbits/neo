module Neo

    class CodeRepoModelFactory
        attr_accessor :user
        
        def initialize(options)
            @user = options["user"]
        end
    end
end