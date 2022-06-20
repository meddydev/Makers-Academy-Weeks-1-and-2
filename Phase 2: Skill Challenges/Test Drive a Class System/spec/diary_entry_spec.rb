require "diary_entry"

describe DiaryEntry do
    it "constructs" do
        entry = DiaryEntry.new("some title", "some contents")
        expect(entry.title).to eq "some title"
        expect(entry.contents).to eq "some contents"
    end

    it "returns correct word count" do
        entry = DiaryEntry.new("some title", "some contents")
        expect(entry.count_words).to eq 2
    end

    it "returns correct reading time" do
        entry = DiaryEntry.new("some title", "We will go home at the end of the day.")
        expect(entry.reading_time(3)).to eq 4
    end

    describe "#reading_chunk" do
        it "returns correct initial chunk of contents" do
            result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?
                ")
            expect(result.reading_chunk(1, 5)).to eq "Will you get a headache"
        end
    
        it "returns final chunk of contents when user can read more than is left of the text" do
            result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?
                ")
            result.reading_chunk(1,8)
            expect(result.reading_chunk(1,5)).to eq "too hard?"
        end
    
        it "restarts contents after finishing the diary" do
            result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?")
            result.reading_chunk(1, 8)
            result.reading_chunk(1, 5)
            expect(result.reading_chunk(1, 2)).to eq "Will you"
        end
    
        it "returns middle chunk of contents after second function call" do
            result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?")
            result.reading_chunk(1, 3)
            expect(result.reading_chunk(1, 4)).to eq  "a headache if you"
        end
    
        it "returns current chunk after multiple calls" do
            result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?")
            result.reading_chunk(1, 2)
            result.reading_chunk(1, 2)
            expect(result.reading_chunk(1, 1)).to eq "headache"
        end
    end
end