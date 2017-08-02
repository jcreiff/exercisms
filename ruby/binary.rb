class Binary

  def self.to_decimal(binary_string, total=0)
    raise ArgumentError, "Invalid binary string" if binary_string.match(/[^01]/)
    binary_string.split("").reverse.each_with_index do |n, index|
      n=="0" ? next : total+=(2 ** index)
    end
    total
  end

end

# tried to use .map, but then I couldn't gauge the index of all the 1s...
