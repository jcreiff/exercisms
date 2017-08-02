class Prime
  attr_reader :primes

  def initialize
    @primes = [2]
  end

  def nth(num)
    raise ArgumentError, "Invalid input" if num < 1
    start = 3
    until primes.length == num do
      primes<<start unless (2...start).to_a.reject{|n| n.even?}.any? {|n| start%n==0}
      start+=2
    end
    primes.last
  end

  def self.nth(num)
    Prime.new.nth(num)
  end
end
  # Found these answers from Stack Overflow/github - first takes about 8 seconds,
  # second is under a second! My method above takes about 6 minutes (!)

  # def nth(n)
  #   up_to = n * (Math.log(n) + 2)
  #   primes = (2..up_to).to_a
  #   primes.each {|num| primes.delete_if {|i| i > num && (i % num) == 0} }
  #   primes[n-1]
  # end
  #
  # def self.nth(num)
  #   Prime.new.nth(num)
  # end

#   class Prime
#   def self.nth(n)
#     validate_input(n)
#     find_primes_to_nth(n)
#     primes[n - 1]
#   end
#
#   class << self
#     private
#
#     def validate_input(n)
#       fail(ArgumentError, 'n must be greater than zero') unless n > 0
#     end
#
#     def find_primes_to_nth(n)
#       while primes.size < n
#         primes << next_candidate if prime?(next_candidate)
#         @next_candidate += 2
#       end
#     end
#
#     def prime?(number)
#       upper_bound = Math.sqrt(number).floor
#       is_prime = true
#       primes.each do |prime|
#         break if prime > upper_bound
#         break unless is_prime &&= !multiple?(number, prime)
#       end
#       is_prime
#     end
#
#     def primes
#       @primes ||= [2]
#     end
#
#     def next_candidate
#       @next_candidate ||= 3
#     end
#
#     def multiple?(n, divisor)
#       n % divisor == 0
#     end
#   end
# end
