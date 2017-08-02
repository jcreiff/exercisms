class Scrabble
  attr_reader :word, :multiplier

  def initialize(word, multiplier="")
    @word = word.nil? ? "" : word.strip.upcase
    @multiplier = (multiplier == :triple ? 3 : multiplier == :double ? 2 : 1)
  end

  def letter_scores
    Hash.new(1).merge({"D"=>2, "G"=>2, "B"=>3, "C"=>3, "M"=>3, "P"=>3, "F"=>4,
      "H"=>4, "V"=>4, "W"=>4, "Y"=>4, "K"=>5, "J"=>8, "X"=>8, "Q"=>10, "Z"=>10})
  end

  def points
    word.split("").map{|letter| letter_scores[letter]}.reduce(:+)
  end

  def score
    word.empty? ? 0 : (points * multiplier)
  end

  def self.score(word, multiplier="")
    Scrabble.new(word, multiplier="").score
  end
end
