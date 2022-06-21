class DiaryEntry
    def initialize(date, contents) # date and contents are strings
        @date = date
        @contents = contents
    end

    def contents
        @contents
    end

    def date
        @date
    end

    def count_words
        @contents.split(" ").length
    end
end