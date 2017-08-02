class Palindromes
  attr_reader :range, :pal_collection

  def initialize(min_factor: 1, max_factor:)
    @max_factor=max_factor
    @min_factor=min_factor
    @range=(min_factor..max_factor).to_a
    @pal_collection=generate
  end

  def generate(output=Hash.new {|h,k| h[k] = []})
    @pal_collection ||= begin
      range.each_with_index do |num1, index|
        products = range[index..-1].map{|num2| num1*num2}
        pals = products.select{|product| product.to_s==product.to_s.reverse}
        pals.each do |pal|
          output[pal]<<[num1, pal/num1].sort
        end
      end
      output
    end
  end

  # Second attempt at generate method, trying to make it faster...still basically
  # takes the same amount of time. If you take out the palindromes.generate line
  # of the tests, it cuts the time in half. (Or if you memoize it, which I realized was an option.)

  # def generate(output=Hash.new {|h,k| h[k] = []})
  #   @pal_collection ||= begin
  #     products = range.map.with_index{|num1,index| range[index..-1].map{|num2| num1*num2}}
  #     pals = products.map{|set| set.select{|product| product.to_s==product.to_s.reverse}}
  #     pals.each_with_index do |pal_set, i|
  #       next if pal_set==[]
  #       pal_set.each do |pal|
  #         output[pal]<<[range[i], pal/range[i]].sort
  #       end
  #     end
  #     output
  #   end
  # end

  def largest
    pal_collection.select{|product, factors| product==pal_collection.keys.max}
  end

  def smallest
    pal_collection.select{|product, factors| product==pal_collection.keys.min}
  end

end

class Hash
  def value
    self.keys.max
  end

  def factors
    self[value]
  end
end
