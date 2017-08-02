class Garden
  attr_reader :diagram, :students

  def initialize(diagram, students=nil)
    @diagram=diagram.split("\n")
    @students=check_students(students).map {|name| name.downcase}
  end

  def check_students(students)
    students.nil? ? %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry) : students.sort
  end

  def method_missing(name)
    find_plants(find_index(name))
  end

  def find_index(name)
    students.index(name.to_s) * 2
  end

  def find_plants(index)
    plants=[]
    diagram.each do |row|
      plants<<row[index, 2].split("").map{|plant| PLANTS[plant]}
    end
    plants.flatten
  end

  PLANTS={"C"=>:clover, "G"=>:grass, "R"=>:radishes, "V"=>:violets}

end
