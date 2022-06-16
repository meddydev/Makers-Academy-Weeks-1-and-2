require 'string_builder'

describe StringBuilder do
    it "empty string is returned if nothing is added to the object" do
        string = StringBuilder.new
        expect(string.output).to eq ""
    end

    it "says the size of the string is zero if nothing is added to it" do
        string = StringBuilder.new
        expect(string.size).to eq 0
    end

    it "returns correct size of string" do
        string = StringBuilder.new
        expect(string.add("dog").size).to eq 3
    end

    it "returns correct string when multiple strings are added to object" do
        string = StringBuilder.new
        string.add("Hi ")
        string.add("I'm ")
        string.add("happy!")
        expect(string.output).to eq "Hi I'm happy!"
    end
end