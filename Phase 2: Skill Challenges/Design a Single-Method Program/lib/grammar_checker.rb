def grammar_checker(text)
    if text == ""
        "Your grammar is incorrect."
    elsif text[0].upcase == text[0] && text.end_with?("!","?", ".")
        "Your grammar is correct."
    else
        "Your grammar is incorrect."
    end
end