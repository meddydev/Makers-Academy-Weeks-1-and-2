# 1. Describe the Problem
# As a user
# So that I can keep track of my tasks
# I want to check if a text includes the string #TODO.
# 2. Design the Method Signature
# name of method: string_searcher
# parameter? some text, variable name is text, data type is string
# return? a string that says if text includes #TODO or not.

require 'string_searcher'

describe "string_searcher method" do
    context "given text that does not include #TODO" do
        it "says text does not include #TODO for empty string" do
            expect(string_searcher("")).to eq "Text does not include #TODO."
        end

        it "says text does not include #TODO for long string of text" do
            result = "dog " * 5000
            expect(string_searcher(result)).to eq "Text does not include #TODO."
        end

        it "says text does not include #TODO for text including TODO" do
            expect(string_searcher("I have a lot TODO today.")).to eq "Text does not include #TODO."
        end

        it "says text does not include #TODO when loweracse #todo is in text" do
            expect(string_searcher("I have a lot #todo: clean my room!")).to eq "Text does not include #TODO."
        end
    end

    it "says text does include #TODO when #TODO is in text" do
        expect(string_searcher("Hi, I have this #TODO: walk dogs.")).to eq "Text includes #TODO."
    end
end