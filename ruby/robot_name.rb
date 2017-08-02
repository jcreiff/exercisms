class Robot
  attr_accessor :name

  def initialize
    reset
  end

  def reset
    @name = NameMaker.new_name
  end

end


class NameMaker

  def self.new_name
    @names ||= []
    @names << make_name
    @names.last
  end

  def self.make_name
    puts @names
    ("A".."Z").to_a.sample(2).join + (100...999).to_a.sample.to_s
  end
end

# doesn't pass final test...
