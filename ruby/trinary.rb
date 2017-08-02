class Trinary
  attr_reader :trinary_string

  def initialize(trinary_string)
    @trinary_string=trinary_string
  end

  def to_decimal(total=0)
    return 0 if trinary_string.match(/[^012]/)
    trinary_string.split("").map(&:to_i).reverse.each_with_index do |n, index|
      total += n * (3 ** index)
    end
    total
  end
end
