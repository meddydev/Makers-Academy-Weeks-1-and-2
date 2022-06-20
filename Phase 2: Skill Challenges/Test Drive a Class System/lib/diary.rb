class Diary
    def initialize
        @entries = []
    end
  
    def add(entry)
        @entries.push(entry)
    end
  
    def all
      @entries
    end
  
    def count_words
        total_words = 0
        @entries.each do |entry|
            total_words += entry.count_words
        end
        total_words
    end
  
    def reading_time(wpm)
        total_reading_time = 0
        @entries.each do |entry|
            total_reading_time += (entry.count_words) / wpm.to_f
        end
        total_reading_time.ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
        best_entry = @entries.select { |entry| entry.count_words <= wpm * minutes }.sort_by(&:count_words)[-1]
    end
end