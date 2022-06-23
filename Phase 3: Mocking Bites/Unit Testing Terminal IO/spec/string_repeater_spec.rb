require "string_repeater"

describe StringRepeater do
    it "asks user for string and repeats it many times" do
        terminal = double(:fake_terminal_class)
        expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
        expect(terminal).to receive(:puts).with("Please enter a string").ordered
        expect(terminal).to receive(:gets).and_return("TWIX").ordered
        expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
        expect(terminal).to receive(:gets).and_return("10").ordered
        expect(terminal).to receive(:puts).with("Here is your result:").ordered
        expect(terminal).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX").ordered


        string_repeater = StringRepeater.new(terminal)
        string_repeater.run
    end
end