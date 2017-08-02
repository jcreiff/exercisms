require 'set'

class SumOfMultiples

  attr_reader :nums, :multiples

  def initialize(num1, num2, num3=nil)
    @nums=[num1, num2, num3].compact
    @multiples=[0]
  end

  def to(max)
    nums.each do |num|
      multiples<< get_multiples(num, max) unless num>max
    end
    multiples.flatten.to_set.reduce(:+)
  end

  def get_multiples(min, max)
    (min...max).to_a.select {|x| x%min==0}
  end

end
