class Array

  def accumulate(&block)
    Array.new(self.size) {|index| yield self[index]}
  end

end
