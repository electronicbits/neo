require_relative 'StepModel'

module Neo
    class StepsModel
        attr_accessor :steps
        
        def initialize(options)
            @steps = []
            #need to go iterate through each step
            options.each { |i_step| 
                step = Neo::StepModel.new(i_step)
                @steps.push (step)
            }
        end
    end
end