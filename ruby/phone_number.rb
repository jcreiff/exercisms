class PhoneNumber

  attr_reader :input, :invalid, :area_code

  def initialize(input)
    @input = sanitize(input)
    @invalid = "0000000000"
    @area_code = number[0..2]
  end

  def sanitize(input)
    input.gsub(/\W/, "")
  end

  def number
    input.match(/\D/) ? invalid : check_input_length
  end

  def check_input_length
    input.length == 10 ? input : input.length > 10 ? check_long_number : invalid
  end

  def check_long_number
    input.length == 11 && input[0] == "1" ? input[1..-1] : invalid
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end

end
