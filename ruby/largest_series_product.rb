class Series
  attr_reader :nums, :orig_nums
  attr_accessor :index, :largest

  def initialize(nums)
    @nums=nums.split("").map{|num| num.to_i}
    @orig_nums=nums
    @index=0
    @largest=0
  end

  def largest_product(range)
    return 1 if range==0
    check_exceptions(range)
    until index+range>nums.size
      product = nums[index...(range+index)].reduce(:*)
      self.index += 1
      self.largest = product if product > self.largest
    end
    largest
  end

  def check_exceptions(range)
    raise ArgumentError, "Invalid range" if range > nums.size || range < 0
    raise ArgumentError, "Invalid series" if orig_nums.match(/\D/)
  end
end
