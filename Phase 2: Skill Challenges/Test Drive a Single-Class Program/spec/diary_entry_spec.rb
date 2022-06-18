# 1. Describe the Problem
# As a user
# So that I can track the books I'm reading
# I want to know what diaries I'm reading, how long they are
# and how long it would take me to read them
# 2. Design the Class Signature
# name of Class: DiaryEntry
# title method: returns title as string
# contents method: returns contents as string
# count_words method: returns word count as integer
# reading_time method: takes 'words per minute' as input and returns
# reading time as an integer
# reading_chunk: returns newest, unread 
# chunk of contents as a string 
# (length will depend on wpm and minutes available). If
# contents are fully read, restart from beginning of contents

require 'diary_entry'

describe DiaryEntry do
    it "constructs" do
        result = DiaryEntry.new("Crime and Punishment", "dog " * 1000)
        expect(result.title).to eq "Crime and Punishment"
        expect(result.contents).to eq "dog " * 1000
    end  
end

describe "#count_words" do
    it "returns correct word count" do
        result = DiaryEntry.new("Crime and Punishment", "dog " * 1000)
        empty = DiaryEntry.new("diary", "")
        expect(result.count_words).to eq 1000
        expect(empty.count_words).to eq 0
    end
end

describe "#reading_time" do
    it "returns correct reading time as an integer" do
        result = DiaryEntry.new("Crime and Punishment", "dog " * 1000)
        expect(result.reading_time(120)).to eq 9
    end
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
        result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?
            ")
        result.reading_chunk(1, 8)
        result.reading_chunk(1, 5)
        expect(result.reading_chunk(1, 2)).to eq "Will you"
    end

    it "returns middle chunk of contents after second function call" do
        result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?
            ")
        result.reading_chunk(1, 3)
        expect(result.reading_chunk(1, 4)).to eq  "a headache if you"
    end

    it "returns current chunk after multiple calls" do
        result = DiaryEntry.new("Crime and Punishment", "Will you get a headache if you think too hard?
            ")
        result.reading_chunk(1, 2)
        result.reading_chunk(1, 2)
        expect(result.reading_chunk(1, 1)).to eq "headache"
    end
end
