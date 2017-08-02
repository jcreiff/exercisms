class CustomSet<Array

  def subset?(other_set)
    self.all?{|item| other_set.include?(item)}
  end

  def disjoint?(other_set)
    !(self.any?{|item| other_set.include?(item)})
  end

  def ==(other_set)
    self.sort==other_set.sort
  end

  def add(element)
    unless self.include?(element)
      self.push(element).sort
    end
    self
  end

  def intersection(other_set)
    self.select{|item| other_set.include?(item)}
  end

  def difference(other_set)
    self.reject{|item| other_set.include?(item)}
  end

  def union(other_set)
    self.push(other_set).flatten.uniq
  end
end
