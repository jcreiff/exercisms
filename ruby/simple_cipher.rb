class Cipher
  attr_reader :key, :alpha, :key_codes

  def initialize(key_input=nil)
    @alpha=("a".."z").to_a * 2
    @key=generate_key(key_input)
    @key_codes=key.split("").map{|char| alpha.index(char)}
  end

  def encode(phrase)
    manipulate_text(phrase, encoding=true)
  end

  def decode(phrase)
    manipulate_text(phrase, encoding=false)
  end

  def manipulate_text(phrase, output="", encoding)
    phrase.split("").map{|char| alpha.index(char)}.each_with_index do |index1, index2|
      encoding ? index1+=key_codes[index2] : index1-=key_codes[index2]
      output+=alpha[index1]
    end
    output
  end

  def generate_key(key_input)
    key_input ||= alpha.sample*100
    raise ArgumentError, "Invalid Key" if key_input.match(/[^a-z]/) || key_input == ""
    key_input
  end
end
