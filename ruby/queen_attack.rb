class Queens
  attr_reader :white, :black

  def initialize(white: nil, black: nil)
    @white=check_position(white)
    @black=check_position(black)
  end

  def check_position(squares)
    squares = [] if squares.nil?
    raise ArgumentError, "Invalid position" if squares.any? {|square| square<0 || square>7}
    squares
  end

  def attack?
    white[0]==black[0] || white[1]==black[1] || (white[0]-black[0]).abs==(white[1]-black[1]).abs
  end
end
