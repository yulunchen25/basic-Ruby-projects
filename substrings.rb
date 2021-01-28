# A basic program that checks a user provided string for any substrings in a provided dictionary and the number of occurences of each substring

puts "Please enter a string of text to check against the dictionary:"
string = gets.chomp
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  dictionary.reduce(Hash.new(0)) do |result, word|
    count = string.downcase.scan(word).count
    result[word] = count if count != 0
    result
  end
end

puts "The substrings that were found and its number of appearances are \"#{substrings(string, dictionary)}\""