class Triangle
  attr_reader :sides, :valid

  def initialize(sides)
    @sides=sides.sort
    @valid=@sides[0..1].reduce(:+)>@sides[2]
  end

  def equilateral?
    valid && sides.uniq.count==1
  end

  def isosceles?
    valid && sides.uniq.count<=2
  end

  def scalene?
    valid && sides.uniq.count==3
  end

end
