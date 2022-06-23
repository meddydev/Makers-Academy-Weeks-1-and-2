class InteractiveCalculator
    def initialize(terminal)
        @terminal = terminal
    end

    def run
        @terminal.puts("Hello. I will subtract two numbers.")
        @terminal.puts("Please enter a number")
        number_one = @terminal.gets
        @terminal.puts("Please enter another number")
        number_two = @terminal.gets
        @terminal.puts("Here is your result:")
        @terminal.puts("#{number_one} - #{number_two} = #{number_one.to_i - number_two.to_i}")
    end
end
