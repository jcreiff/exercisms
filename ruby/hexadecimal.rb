class Hexadecimal
  attr_reader :hex

  def initialize(hex)
    @hex=hex.split("").map{|char| HEX_VALUES[char]}
  end

  def to_decimal
    return 0 if hex.any?{|char| char==nil}
    hex.reverse.map.with_index{|num, index| num*(16**index)}.reduce(:+)
  end

  HEX_VALUES={"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7,
    "8"=>8, "9"=>9, "a"=>10, "b"=>11, "c"=>12, "d"=>13, "e"=>14, "f"=>15}

end
