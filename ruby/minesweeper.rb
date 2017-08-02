class Board
  attr_reader :rows

  def initialize(rows)
    @rows=rows
  end

  def transform
    check_for_errors
    rows.map.with_index{|row, row_index| row.split("").map.with_index{|spot, spot_index| check_spot(spot, row_index, spot_index)}.join}
  end

  def check_spot(spot, x, y, count=0)
    return spot if ["|", "+", "-", "*"].member?(spot)
    neighbors = [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]]
    neighbors.each {|n| count+=1 if rows[n[0]][n[1]]=="*"}
    count==0 ? spot : count
  end

  def check_for_errors
    raise MinesweeperTest::ValueError, "Invalid Board" unless rows.map{|row| row.length}.uniq.count==1
    raise MinesweeperTest::ValueError, "Invalid Border" unless rows[1..-2].all?{|row| row[0] + row[-1] == "||"}
    raise MinesweeperTest::ValueError, "Invalid Border" unless (rows[0]+rows[-1]).split("").all?{|char| ["+", "-"].member?(char)}
    raise MinesweeperTest::ValueError, "Invalid Character" unless rows.flatten.join.split("").all?{|char| ["|", "+", "-", "*", " "].member?(char)}
  end

  def self.transform(rows)
    Board.new(rows).transform
  end
end
