def count_words(words)
    words_minus_punc = words.delete("!£#%&()-[]{}:;',.?")
    words_minus_punc.split(" ").count
end