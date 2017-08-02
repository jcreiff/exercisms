class Triplet
  attr_reader :digits, :sum, :product

  def initialize(a,b,c)
    @digits = [a,b,c]
    @sum = @digits.reduce(:+)
    @product = @digits.reduce(:*)
  end

  def pythagorean?
    digits[0] ** 2 + digits[1] ** 2 == digits[2] ** 2
  end

  def self.where(min_factor: 1, max_factor:, sum: nil)
    range = (min_factor..max_factor).to_a
    groups = range.permutation(3).map{|set| set.flatten.sort}.uniq
    valid = groups.select{|group| Triplet.new(group[0], group[1], group[2]).pythagorean?}
    triplets = valid.map{|triplet| Triplet.new(triplet[0], triplet[1], triplet[2])}
    sum ? triplets.select{|triplet| triplet.sum==sum} : triplets
  end

end
