require "diary_entry"

describe DiaryEntry do
    it "constructs" do
        entry = DiaryEntry.new("21 Jun", "Rather sunny out today!")
        expect(entry.contents).to eq "Rather sunny out today!"
        expect(entry.date).to eq "21 Jun"
    end

    it "returns correct word count" do
        entry0 = DiaryEntry.new("21 Jun", "Rather sunny out today!")
        expect(entry0.count_words).to eq 4
    end

    it "returns 0 word count when no contents given" do
        entry0 = DiaryEntry.new("21 Jun", "")
        expect(entry0.count_words).to eq 0
    end
end