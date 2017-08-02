class Bst
  attr_reader :data, :all_branches
  attr_accessor :left, :right

  def initialize(data)
    @data=data
    @left=nil
    @right=nil
    @all_branches=[self]
  end

  def insert(num)
    new_branch = (num.class == Bst ? num : Bst.new(num))
    all_branches<<new_branch
    if new_branch.data<=data
      left.nil? ? self.left=new_branch : left.insert(new_branch)
    else
      right.nil? ? self.right=new_branch : right.insert(new_branch)
    end
  end

  def each(&block)
     if block_given?
       all_branches.sort_by(&:data).each {|bst| yield bst.data}
     else
       self.to_enum
     end

  end

  VERSION=1
end
