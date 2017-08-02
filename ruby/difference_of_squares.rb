class Squares
  attr_reader :num_range, :num

  def initialize(num)
    @num=num
    @num_range=(1..num).to_a
  end

  def square_of_sum
    return 0 if num==0
    num_range.reduce(:+) ** 2
  end

  def sum_of_squares
    return 0 if num==0
    num_range.map{|i| i**2}.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
