require 'grammar_stats'

describe GrammarStats do
    describe "#check" do
        it "returns true for text with proper grammar" do
            result = GrammarStats.new
            expect(result.check("Hello there!")).to eq true
        end

        it "returns false for text with improper grammar" do
            result = GrammarStats.new
            expect(result.check("hello there!")).to eq false
        end

        it "returns error for empty string" do
            result = GrammarStats.new
            expect { result.check("") }.to raise_error "No text given."
        end
    end

    describe "#percentage_good" do
        it "raises error if no text has been checked yet" do
            result = GrammarStats.new
            expect { result.percentage_good }.to raise_error "No text has been checked yet."
        end

        context "one input given" do
            it "returns 100 for one correct text" do
                result = GrammarStats.new
                result.check("Hi there!")
                expect(result.percentage_good).to eq 100
            end

            it "returns 0 for one incorrect text" do
                result = GrammarStats.new
                result.check("hi there?")
                expect(result.percentage_good).to eq 0
            end
        end

        it "returns correct integer percentage after multiple texts checked" do
            test = GrammarStats.new
            test.check("Hi!")
            test.check("Hey.")
            test.check("sup")
            expect(test.percentage_good).to eq 67
        end
    end
end

