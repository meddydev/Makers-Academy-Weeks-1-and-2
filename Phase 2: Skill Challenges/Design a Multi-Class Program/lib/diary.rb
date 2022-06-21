class Diary
    def initialize
        @entries = []
    end

    def add(entry)
        @entries.push(entry)
    end

    def list
        @entries
    end

    def search_for_phone_numbers
        phone_numbers = []
        @entries.each do |entry|
            split_entries = entry.contents.split(" ")
            split_entries.each do |split_entry|
                if split_entry[0] == "0" && split_entry.length == 11
                    phone_numbers.push(split_entry)
                end
            end
        end
        phone_numbers
    end

    def select_most_readable_entry(wpm, minutes)
        possible_entries = @entries.select{|entry| entry.count_words <= wpm * minutes}
        possible_entries.sort_by {|entry| entry.count_words}[-1]
    end
end