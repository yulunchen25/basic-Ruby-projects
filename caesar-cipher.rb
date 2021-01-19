# A basic program that applies a Caesar cipher to a string supplied by the user as well as a shift factor

puts "Please enter the text to encrypt:"
text = gets.chomp
puts "Please enter the shift factor (numbers only):"
shift = gets.chomp.to_i

def caesar_cipher(text, shift)
  text.split(//).map do |letter|
    if letter.ord.between?(65, 90)
      ((letter.ord - 65 + shift) % 26 + 65).chr
    elsif letter.ord.between?(97, 122)
      ((letter.ord - 97 + shift) % 26 + 97).chr
    else
      letter
    end
  end
  .join
end

puts "Your encrypted text is \"#{caesar_cipher(text, shift)}\""