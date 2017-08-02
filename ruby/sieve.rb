class Sieve

  attr_reader :upper_bound

  def initialize(upper_bound)
    @upper_bound=upper_bound
  end

  def primes(divisor=2, group=(2..upper_bound).to_a)
    return [] if upper_bound < 2
    group.delete_if{|num| num%divisor==0 && num!=divisor}
    divisor == 2 ? divisor+=1 : divisor+=2
    divisor +=2 until group.include?(divisor) || divisor>(upper_bound/2)
    divisor>(upper_bound/2) ? group : primes(divisor, group)
  end


end
