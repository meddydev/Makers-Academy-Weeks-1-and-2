require 'report_length'

describe "report_length method" do
    it "returns a message saying how long string is for a short word" do
        result = report_length("dog")
        expect(result).to eq "This string was 3 characters long."
    end

    it "returns a message saying how long string is for a one letter word" do
        result = report_length("a")
        expect(result).to eq "This string was 1 character long."
    end

    it "returns a message saying how long string is for a long word" do
        result = report_length("uncircumstandtial")
        expect(result).to eq "This string was 17 characters long."
    end

    it "returns a message saying how long string is for a word with a mix of upper and lower case" do
        result = report_length("Blade")
        expect(result).to eq "This string was 5 characters long."
    end

    it "returns a message saying how long string is for a string with spaces" do
        result = report_length("A B C D E F G")
        expect(result).to eq "This string was 13 characters long."
    end
end