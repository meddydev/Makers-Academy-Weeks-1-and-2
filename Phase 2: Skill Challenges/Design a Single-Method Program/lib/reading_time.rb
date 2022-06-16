# 1. Describe the Problem
# As a user
# So that I can manage my time
# I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

# 2. Design the Method Signature
# method name: words_to_time
# parameter: variable name is 'text'. Data type is string.
# returns? A string that displays the reading time conversion (assuming 200 words a minute reading speed).

def words_to_time(text)
    word_count = text.split(" ").count
    if word_count != 200
        return "Reading time is #{word_count / 200.0} minutes."
    else
        return "Reading time is 1.0 minute."
    end
end