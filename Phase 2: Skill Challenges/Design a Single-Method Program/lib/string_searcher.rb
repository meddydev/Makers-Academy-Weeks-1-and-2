def string_searcher(text)
    text.include?("#TODO") ? "Text includes #TODO." : "Text does not include #TODO."
end