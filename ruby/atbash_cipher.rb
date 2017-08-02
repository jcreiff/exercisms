class Atbash

  def self.encode(text, output="", count=0)
    stripped = text.downcase.gsub(/[^a-z|0-9]/, "").split("")
    subbed = stripped.map{|char| ALPHA.include?(char) ? ALPHA[25 - ALPHA.index(char)] : char}
    subbed.each do |char|
      count+=1
      output+=char
      output+=" " if count%5==0
    end
    output.strip
  end

  ALPHA = ("a".."z").to_a

end
