class Array

  def method_missing (name, &block)
    return self if self.empty?
    name == :keep ? self.keep_if(&block) : self.delete_if(&block)
  end

end
