def make_snippet(string)
    words = string.split(" ")
    if words.count <= 5
        return string
    else
        five_words = words[0,5]
        return five_words.join(" ") + " ..."
    end
end