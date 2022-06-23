require "interactive_calculator"

describe InteractiveCalculator do
    context "tells user it will subtract 2 numbers and asks user for those numbers" do
        it "subtracts second user given number from first" do
            terminal = double(:fake_terminal_class)
            expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
            expect(terminal).to receive(:puts).with("Please enter a number").ordered
            expect(terminal).to receive(:gets).and_return("4").ordered
            expect(terminal).to receive(:puts).with("Please enter another number").ordered
            expect(terminal).to receive(:gets).and_return("3").ordered
            expect(terminal).to receive(:puts).with("Here is your result:").ordered
            expect(terminal).to receive(:puts).with("4 - 3 = 1").ordered
            interactive_calculator = InteractiveCalculator.new(terminal)
            interactive_calculator.run
        end
    end
end