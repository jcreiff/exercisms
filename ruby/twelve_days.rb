class TwelveDays

  def self.song(full_song="")
    (1..12).to_a.map {|num| self.verse(num)+"\n"}.join("\n")
  end

  def self.verse(num)
    lyrics = "On the #{VARIATIONS[num][0]} day of Christmas my true love gave to me, "
    until num==0
      lyrics += VARIATIONS[num][1]
      lyrics += "and " if num==2
      num-=1
    end
    lyrics
  end

  VARIATIONS = {1=>["first", "a Partridge in a Pear Tree."], 2=>["second", "two Turtle Doves, "],
    3=>["third", "three French Hens, "], 4=>["fourth", "four Calling Birds, "],
    5=>["fifth", "five Gold Rings, "], 6=>["sixth", "six Geese-a-Laying, "],
    7=>["seventh", "seven Swans-a-Swimming, "], 8=>["eighth", "eight Maids-a-Milking, "],
    9=>["ninth", "nine Ladies Dancing, "], 10=>["tenth", "ten Lords-a-Leaping, "],
    11=>["eleventh", "eleven Pipers Piping, "], 12=>["twelfth", "twelve Drummers Drumming, "]}

end
