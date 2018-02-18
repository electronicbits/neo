module Neo

    class CodeRepoModelFactory
        attr_accessor :user
        
        def initialize(options)
            @user = options["user"]
            
        end
        
        def get_binding
            binding
        end
    end
end