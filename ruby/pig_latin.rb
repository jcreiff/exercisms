class PigLatin

  def self.translate(word_or_phrase)
    word_or_phrase.split.map {|word| self.mod_word(word)}.join(" ")
  end

  def self.mod_word(word, displaced = "")
    displaced += word.slice!(0) until self.end_of_sound?(word, displaced) || word.length == 1
    word + displaced + "ay"
  end

  def self.end_of_sound?(word, displaced)
    ("aeiou".include?(word[0]) && displaced[-1] != "q") || ["yt", "xr"].include?(word[0..1])
  end

end
