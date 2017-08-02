class Brackets
  attr_reader :complete_set, :sets

  def initialize(input)
    @complete_set=input.gsub(/[^{|}|(|)|\[|\]]/, "").split("")
    @braces=complete_set.select{|char| char=="[" || char=="]"}
    @brackets=complete_set.select{|char| char=="{" || char=="}"}
    @parens=complete_set.select{|char| char=="(" || char==")"}
    @sets=[["[","]", @braces],["{","}", @brackets],["(",")", @parens]]
  end

  def paired?
    check_counts && check_closures && check_nesting
  end

  def check_counts
    sets.each {|set| return false unless set[2].count(set[0]) == set[2].count(set[1])}
    true
  end

  def check_closures
    sets.each do |set|
      first_opener = set[2].index(set[0])
      first_closure = set[2].index(set[1])
      comparison = first_opener ^ first_closure
      return false if comparison == true
      next if comparison == false
      return false if first_opener > first_closure
    end
    true
  end

  def check_nesting
    !(["[}","[)","{]","{)""(]","(}"].any?{|pair| complete_set.join.include?(pair)})
  end

  def self.paired?(input)
    Brackets.new(input).paired?
  end

  # check for # of opener == # of closure for each (to catch hanging openers)
  # check for index of close being less than index of open (to catch ][)
  # check for any wacky pairings like {] or (}

end
