class Acronym

  def self.abbreviate(phrase)
    acronym = ""
    phrase.split(" ").each do |word|
      word.split("-").each do |subword|
      acronym += subword[0]
      camels = subword.match(/[A-Z]/, 1)
      camels.to_a.each {|letter| acronym += letter} unless word.upcase==word
      end
    end
    acronym.upcase
  end

end
