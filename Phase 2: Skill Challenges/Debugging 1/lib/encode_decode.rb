def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    # puts "cipher is #{cipher}"
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    #   puts "plaintext character #{char} turns into #{(65 + cipher.find_index(char)).chr}"
    end
    # puts "encoded message is #{ciphertext_chars.join}"
    return ciphertext_chars.join
end

def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    # puts "cipher is #{cipher}"
    plaintext_chars = ciphertext.chars.map do |char|
        cipher[char.ord - 65]
        # puts "Plaintext character #{char} turns into #{cipher[char.ord - 65]} and this is the (6char.ord)th or #{char.ord - 65}th index of the cipher"
    end
    return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")