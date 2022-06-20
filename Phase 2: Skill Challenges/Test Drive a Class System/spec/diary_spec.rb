require "diary"

describe Diary do
    it "constructs" do
        diary = Diary.new
        expect(diary.all).to eq []
    end

    context "when no entries have been added" do
        it "returns a word count of 0" do
            diary = Diary.new
            expect(diary.count_words).to eq 0
        end

        it "returns a reading time of 0" do
            diary = Diary.new
            expect(diary.reading_time(1)).to eq 0
        end

        it "returns nil when trying to find best entry for reading time when no entries have been added" do
            diary = Diary.new
            result = diary.find_best_entry_for_reading_time(1, 10)
            expect(result).to eq nil
        end
    end
end