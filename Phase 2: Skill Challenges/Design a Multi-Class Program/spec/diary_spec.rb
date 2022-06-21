require "diary"

describe Diary do
    it "constructs" do
        diary = Diary.new
        expect(diary.list).to eq []
    end

    it "returns empty list when searching for phone numbers after no entries have been added" do
        diary = Diary.new
        expect(diary.search_for_phone_numbers).to eq []
    end

    it "returns empty list when tring to select most readable entry after no entries have been added" do
        diary = Diary.new
        expect(diary.select_most_readable_entry(120, 10)).to eq nil
    end
end