class SimpleLinkedList
  attr_accessor :list

  def initialize(preset_list=[])
    @list=generate_list(preset_list)
  end

  def push(element)
    list.unshift(element)
    return self
  end

  def pop
    list.shift
  end

  def to_a
    list.map{|element| element.datum}
  end

  def reverse!
    return self if to_a == []
    self.list=list.reverse!
    to_a
  end

  def generate_list(preset_list)
    return preset_list if preset_list==[]
    preset_list.map{|num| Element.new(num)}.reverse
  end

end

# Probably the spirit of this was to make the Element.next bit smarter, once
# the elements were grouped in the list, but the tests didn't really validate that

class Element
  attr_reader :datum
  attr_accessor :next_element

  def initialize(num)
    @datum=num
    @next_element=nil
  end

  def next
    next_element
  end

  def next=(other_element)
    self.next_element=other_element
  end
end
