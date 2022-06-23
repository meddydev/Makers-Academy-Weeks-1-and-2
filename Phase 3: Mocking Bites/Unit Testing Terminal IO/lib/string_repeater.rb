class StringRepeater
    def initialize(terminal)
        @terminal = terminal
    end

    def run
        @terminal.puts("Hello. I will repeat a string many times.")
        @terminal.puts("Please enter a string")
        string = @terminal.gets.chomp
        @terminal.puts("Please enter a number of repeats")
        repeat_number = @terminal.gets.chomp.to_i
        @terminal.puts("Here is your result:")
        @terminal.puts(string * repeat_number)
    end
end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run