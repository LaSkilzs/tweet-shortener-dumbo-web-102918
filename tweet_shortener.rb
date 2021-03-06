def dictionary
  dictionary = {
    "hello" => "hi",
    "to, two, too" => "2",
    "for, four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(string)
  string_array = string.split(" ")
  dictionary_keys = []
  dictionary_values = dictionary.values
  
  dictionary.each{|k,v| dictionary_keys << k.split(" ")}
  
  i = 0
  while i < dictionary_keys.count
    j = 0
    while j < dictionary_keys[i].length
      string_array.each_with_index do |word, idx|
        string_array[idx] = dictionary_values[i] if dictionary_keys[i][j].delete(",") == word.downcase
      end
      j += 1
    end
    i += 1
  end
  string_array.join(" ")
end

def bulk_tweet_shortener(array)
  array.each{|string| puts word_substituter(string)}
end

def selective_tweet_shortener(string)
  string.length > 140 ? word_substituter(string) : string
end

def shortened_tweet_truncator(string)
  new_string = selective_tweet_shortener(string)
  new_string.length > 140 ? new_string[0..139] : new_string
end