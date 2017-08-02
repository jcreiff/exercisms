class Phrase
  def initialize(phrase)
    @phrase=sanitize(phrase)
    @words={}
  end

  def word_count
    @phrase.each do |word|
      @words[word]=@phrase.count(word)
    end
    @words
  end

  def sanitize(phrase)
    phrase=phrase.downcase.gsub(/[\W&&[^']]/, " ").split(" ").each do |word|
      word.gsub!(/[']/, "") if word.start_with?("'") || word.end_with?("'")
    end
  end
end
