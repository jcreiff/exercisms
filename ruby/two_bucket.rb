class TwoBucket
  attr_reader :first, :second, :goal, :moves, :goal_bucket, :other_bucket

  def initialize(small, large, goal, start)
    @first = start=="one" ? Bucket.new(small, "one") : Bucket.new(large, "two")
    @second = start=="one" ? Bucket.new(large, "two" ) : Bucket.new(small, "one")
    @goal=goal
    result = pour(first, second)
    @moves = result[0]
    @goal_bucket = result[1]
    @other_bucket = result[2]
  end

  def pour(first, second, count=0)
    return [count, first.name, second.current] if first.current==goal
    return [count, second.name, first.current] if second.current==goal
    first.current==0 ? first.fill : second.current<second.capacity ? first.transfer(second) : second.empty
    pour(first, second, count+1)
  end
end

class Bucket
  attr_reader :capacity, :name
  attr_accessor :current

  def initialize(capacity, name, current=0)
    @capacity=capacity
    @name=name
    @current=current
  end

  def fill
    self.current=capacity
  end

  def empty
    self.current=0
  end

  def transfer(other_bucket)
    free = other_bucket.capacity - other_bucket.current
    if current < free
      other_bucket.current+=self.current
      self.current = 0
    else
      other_bucket.current=other_bucket.capacity
      self.current-=free
    end
  end
end
