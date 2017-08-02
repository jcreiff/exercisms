class Fixnum

  def to_roman
    string = ""
    total = self
    DIGITS.each do |arabic, roman|
      dividend, remainder = total.divmod(arabic)
      next if dividend == 0
      dividend.times do
        string += roman
      end
      total = remainder
    end
    string
  end

  DIGITS = { 1000=>"M", 900=>"CM", 500=>"D", 400=>"CD", 100=>"C", 90=>"XC",
      50=>"L",  40=>"XL", 10=>"X", 9=>"IX", 5=>"V", 4=>"IV", 1=>"I"}

end

class String

  def to_arabic
    total = 0
    string = self.dup
    NUMERALS.each do |roman, arabic|
      next unless string.include?(roman)
      total += arabic * (string.count(roman)/roman.length)
      string.delete!(roman)
    end
    total
  end

  NUMERALS = {"CM"=>900, "CD"=>400, "XC"=>90, "XL"=>40, "IX"=>9, "IV"=>4,
      "M"=>1000, "D"=>500, "C"=>100, "L"=>50, "X"=>10, "V"=>5, "I"=>1}

end
