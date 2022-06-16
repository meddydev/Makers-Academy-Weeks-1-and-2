require 'reading_time'

describe "words_to_time method" do
    it "returns zero for empty string" do
        expect(words_to_time("")).to eq "Reading time is 0.0 minutes."
    end

    it "returns correct time for 200 word string" do
        result = "dog " * 200
        expect(words_to_time(result)).to eq "Reading time is 1.0 minute."
    end

    it "returns correct time for short string" do
        expect(words_to_time("happy days")).to eq "Reading time is 0.01 minutes."
    end

    it "returns correct time for very long string" do
        result = "dog " * 10000
        result1 = "dog " * 3000
        expect(words_to_time(result)).to eq "Reading time is 50.0 minutes."
        expect(words_to_time(result1)).to eq "Reading time is #{3000/200.0} minutes."
    end
end