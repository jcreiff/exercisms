class Grains

  def self.square(num)
    raise ArgumentError, "Number of squares can't be less than 1" if num < 1
    raise ArgumentError, "Number of squares can't be greater than 64" if num > 64
    2 ** (num-1)
  end

  def self.total
    (1..64).to_a.map {|i| 2**(i-1)}.reduce(:+)
  end
end
