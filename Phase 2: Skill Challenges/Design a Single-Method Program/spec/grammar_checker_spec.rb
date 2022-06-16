# 1. Describe the problem
# As a user
# So that I can improve my grammar
# I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.
# 2. Design the method signature
# name of method: grammar_checker
# parameter? variable name is 'text'. Data type is string.
# returns? String that says if grammar is correct or not.

require 'grammar_checker'

describe "grammar_checker method" do
    it "says that grammar is correct for a correct string" do
        expect(grammar_checker("Hello!")).to eq "Your grammar is correct."
    end

    it "says that grammar is incorrect for a string starting with lowercase" do
        expect(grammar_checker("hello!")).to eq "Your grammar is incorrect."
    end

    it "says that grammar is incorrect for a string not ending in appropriate punctuation" do
        expect(grammar_checker("Hiya there")).to eq "Your grammar is incorrect."
    end

    it "says grammar is correct for long sentence that has correct grammar" do
        expect(grammar_checker("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")).to eq "Your grammar is correct."
    end

    it "says grammar is incorrect for empty string" do
        expect(grammar_checker("")).to eq "Your grammar is incorrect."
    end
end