class GrammarStats
    def initialize
        @correct_texts = 0
        @total_texts = 0
    end
  
    def check(text)
        fail "No text given." if text == ""
        if text[0] == text[0].upcase && text[-1].count(".!?") == 1
            @correct_texts += 1
            @total_texts += 1
            true
        else
            @total_texts += 1
            false
        end
    end
  
    def percentage_good
        fail "No text has been checked yet." if @total_texts == 0
        ((@correct_texts / @total_texts.to_f) * 100).round
    end
end