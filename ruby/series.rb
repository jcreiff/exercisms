class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(size)
    raise ArgumentError, "Invalid slice size" if size > digits.length
    sliced_digits = []
    digits_to_slice = digits.split("")
    until digits_to_slice.length < size
      sliced_digits<<digits_to_slice.first(size).join
      digits_to_slice.shift
    end
    sliced_digits.flatten
  end
end
