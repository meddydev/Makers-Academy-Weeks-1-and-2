def report_length(str)
    length = str.length
    if length == 1
        return "This string was 1 character long."
    else
        return "This string was #{length} characters long."
    end
end