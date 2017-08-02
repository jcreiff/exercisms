class Luhn
  attr_reader :num_array

  def initialize(number)
    @num_array = number.to_s.split("").map(&:to_i)
  end

  def addends
    num_array.reverse.map.with_index {|num, index| index.odd? ? replacements[num] : num }.reverse
  end

  def replacements
    {1=>2, 2=>4, 3=>6, 4=>8, 5=>1, 6=>3, 7=>5, 8=>7, 9=>9, 0=>0}
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    luhn = Luhn.new(num)
    luhn.num_array<<0
    check_digit = 10 - (luhn.checksum % 10)
    luhn.num_array[-1] = check_digit unless check_digit == 10
    luhn.num_array.join.to_i
  end
end
