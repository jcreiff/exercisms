class Bob

  def self.hey(remark)
    return "Sure." if BobBrain.new(remark).question?
    return "Whoa, chill out!" if BobBrain.new(remark).shouting?
    return "Fine. Be that way!" if BobBrain.new(remark).silence?
    return "Whatever."
  end


end

class BobBrain
  def initialize(remark)
    @remark=remark.split("")
  end

  def shouting?
    !(@remark.any? {|letter| ("a".."z").include?(letter)}) && @remark.any? {|letter| ("A".."Z").include?(letter)}
  end

  def question?
    @remark.last =="?" && !(shouting?)
  end

  def silence?
    @remark.join("").strip.empty?
  end

end
