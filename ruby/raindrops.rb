class Raindrops
  attr_reader :drops

  def initialize
    @drops=[]
  end

  def convert(num)
    [3,5,7].map{|factor| drops<<NOISES[factor] if num%factor==0}
    drops==[] ? num.to_s : drops.join("")
  end

  NOISES={3=>"Pling", 5=>"Plang", 7=>"Plong"}

  def self.convert(num)
    Raindrops.new.convert(num)
  end
end
