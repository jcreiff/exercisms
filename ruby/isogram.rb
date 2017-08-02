require 'set'

class Isogram

  def self.is_isogram?(phrase)
    letters=phrase.downcase.gsub(/\W/, "")
    letters.split("").to_set.length == letters.length
  end

end
