require "diary_entry"
require "diary"

describe "diary_manager" do
    context "when no entries have been added" do 
        it "returns empty list" do
            diary = Diary.new
            expect(diary.all).to eq []
        end
    end

    context "when one entry is added" do
        it "returns a one item list with that entry" do
            diary = Diary.new
            entry = DiaryEntry.new("some title", "some contents")
            diary.add(entry)
            expect(diary.all).to eq [entry]
        end

        it "returns the one entry as the best entry given reading time (if it's not over the length the user could read)" do
            diary = Diary.new
            entry = DiaryEntry.new("some title", "some contents")
            diary.add(entry)
            result = diary.find_best_entry_for_reading_time(1,10)
            expect(result).to eq entry
        end

        it "returns nil as the best entry given reading time (if entry is over the length the user could read)" do
            diary = Diary.new
            entry = DiaryEntry.new("some title", "some contents")
            diary.add(entry)
            result = diary.find_best_entry_for_reading_time(1,1)
            expect(result).to eq nil
        end
    end

    context "when multiple entries are added" do
        it "returns a list of all entries" do
            diary = Diary.new
            entry0 = DiaryEntry.new("some title", "some contents")
            entry1 = DiaryEntry.new("some other title", "some other contents") 
            diary.add(entry0)
            diary.add(entry1)
            expect(diary.all).to eq [entry0, entry1]
        end

        it "returns the number of words in all diary entries" do
            diary = Diary.new
            entry0 = DiaryEntry.new("some title", "some contents")
            entry1 = DiaryEntry.new("some other title", "some other contents")
            diary.add(entry0)
            diary.add(entry1)
            expect(diary.count_words).to eq 5
        end

        it "returns reading time for all entries" do
            diary = Diary.new
            entry0 = DiaryEntry.new("some title", "some contents")
            entry1 = DiaryEntry.new("some other title", "some other contents")
            diary.add(entry0)
            diary.add(entry1)
            expect(diary.reading_time(2)).to eq 3
        end

        it "correctly selects the beest entry given reading time available" do
            diary = Diary.new
            entry0 = DiaryEntry.new("some title", "some")
            entry1 = DiaryEntry.new("some other title", "some words")
            entry2 = DiaryEntry.new("some title", "some words are")
            entry3 = DiaryEntry.new("some title", "some words are written")
            diary.add(entry0)
            diary.add(entry1)
            diary.add(entry2)
            diary.add(entry3)
            result = diary.find_best_entry_for_reading_time(1, 3)
            expect(result).to eq entry2
        end
    end
end