require 'count_words'

describe "count_words method" do
    it "returns zero for empty string" do
        expect(count_words("")).to eq 0
    end

    it "returns correct count for string with many words" do
        expect(count_words("Will you get a headache if you think too hard")).to eq 10
    end

    it "returns correct count for string with multiple punctuation marks" do
        expect(count_words("Hi! Are you, perhaps, happy today?")).to eq 6
    end

    it "returns correct word count when string contains emoji-adjacent punctuation" do
        expect(count_words("Hey Julia! :) how are you?")).to eq 5
    end
end