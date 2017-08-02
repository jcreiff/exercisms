class ListOps
  def self.arrays(objects)
    objects.count
  end

  def self.reverser(items, new_array: [])
    new_array.push(items.pop) until items==[]
    new_array
  end

  def self.concatter(*sets, new_array: [])
    sets.each {|set| new_array<<set}
    new_array.flatten
  end

  def self.mapper(items, &block)
    items.each_with_index {|item, index| items[index] = yield item}
  end

  def self.filterer(items, &block)
    items.each_with_index {|item, index| items[index]=nil unless yield item}.compact
  end

  def self.sum_reducer(set, total: 0)
    set.each{|num| total+=num}
    total
  end

  def self.factorial_reducer(set, total: 1)
    set.each{|num| total*=num}
    total
  end
end
