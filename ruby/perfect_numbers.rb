class PerfectNumber

  def self.classify(num)
    raise RuntimeError, "Number must be positive" if num<1
    sum = (1...num).to_a.select{|i| num % i ==0}.reduce(:+)
    sum == num ? "perfect" : sum > num ? "abundant" : "deficient"
  end

end
