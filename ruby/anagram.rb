class Anagram

  attr_reader :letters, :matches, :original_word

  def initialize(word)
    @original_word = word.downcase
    @letters = original_word.split("").sort
    @matches = []
  end

  def match(words)
    words.each do |word|
      is_match?(word.downcase) ? matches<<word : next
    end
    matches
  end

  def is_match?(word)
    letters == word.split("").sort && word != original_word
  end
end
