class BeerSong
  attr_reader :bottles, :nouns

  def initialize
    @bottles = Hash.new{|h,k| h[k]= k.to_s + " bottles"}.merge({1=>"1 bottle", 0=>"no more bottles", -1=>"99 bottles"})
    @nouns = Hash.new("one").merge({1=>"it"})
  end

  def verse(num)
    first_line(num) + end_of_verse(num)
  end

  def verses(start, last, lyrics=[])
    until start<last
      lyrics<<verse(start)
      start-=1
    end
    lyrics.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  def first_line(num)
    "#{@bottles[num].capitalize} of beer on the wall, #{@bottles[num]} of beer.\n"
  end

  def end_of_verse(num)
    final_verse(num) + "#{@bottles[num-1]} of beer on the wall.\n"
  end

  def final_verse(num)
    num == 0 ? "Go to the store and buy some more, ": "Take #{@nouns[num]} down and pass it around, "
  end
end
