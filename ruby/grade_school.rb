class School
  attr_reader :roll

  def initialize
    @roll = Hash.new {|h,k| h[k]=[]}
  end

  def students(grade)
    roll[grade].sort
  end

  def add(name, grade)
    roll[grade]<<name
  end

  def students_by_grade
    full_roster = []
    roll.keys.sort.each do |grade|
      full_roster<<{grade: grade, students: roll[grade].sort}
    end
    full_roster
  end

end
