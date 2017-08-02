class PrimeFactors
  def find_for(number, factors=[])
    return factors if number < 2
    factor = (2..number).find {|divisor| number%divisor==0}
    number /= factor
    find_for(number, factors<<factor)
  end

  def self.find_for(number)
    PrimeFactors.new.find_for(number)
  end
end

# Original attempt at solving with recursion is below.
# Worked for all but the last test, which hit a stack overflow.

# require 'prime'
#
# class PrimeFactors
#   attr_reader :factors
#
#   def initialize
#     @factors=[]
#   end
#
#   def find_for(number, factor=2)
#     return @factors if number < 2
#     if number%factor==0
#       factors << factor
#       number = number/factor
#     else
#       factor+=1
#     end
#     find_for(number, factor)
#   end
#
#   def self.find_for(number)
#     PrimeFactors.new.find_for(number)
#   end
# end
