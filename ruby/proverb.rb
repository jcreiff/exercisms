class Proverb
  attr_reader :items, :qualifier

  def initialize(*items, qualifier: "")
    @items=items
    @qualifier=form_qualifier(qualifier)
  end

  def to_s(output="", index=0)
    return output if index==items.length
    output+=(form_line(items[index], items[index+1]))
    to_s(output, index+=1)
  end

  def form_line(first, second)
    second.nil? ? "And all for the want of a #{qualifier}#{items.first}." : "For want of a #{first} the #{second} was lost.\n"
  end

  def form_qualifier(qualifier)
    qualifier == "" ? qualifier : qualifier + " "
  end
end
