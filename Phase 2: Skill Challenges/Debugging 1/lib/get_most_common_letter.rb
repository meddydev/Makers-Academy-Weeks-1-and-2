def get_most_common_letter(text)
    counter = Hash.new(0)
    # puts "counter hash is initially #{counter}"
    text.chars.each do |char|
        if char != " "  
            counter[char] += 1
            # puts "counter hash is now #{counter}"
        end
    end
    # puts "counter converted to array is #{counter.to_a}"
    # puts "sorted array is #{counter.to_a.sort_by { |k, v| v }}"
    counter.to_a.sort_by { |k, v| v }.reverse[0][0]
  end
  
  # Intended output:
  # 
  # > get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"

  puts get_most_common_letter("the roof, the roof, the roof is on fire!")