class DiaryEntry
    def initialize(title, contents)
        @title = title
        @contents = contents
        @count = 0
    end
  
    def title
      @title
    end
  
    def contents
      @contents
    end
  
    def count_words
        @contents.split(" ").length
    end
  
    def reading_time(wpm)
        (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes)
        chunk_length = wpm * minutes
        if @count + chunk_length >= count_words
            last_words = contents_array[(@count - count_words)..-1].join(" ")
            @count = 0
            return last_words
        else
            current_chunk = contents_array[@count, chunk_length].join(" ")
            @count += chunk_length
            return current_chunk
        end
    end

    private
    
    def contents_array
        @contents.split(" ")
    end
end