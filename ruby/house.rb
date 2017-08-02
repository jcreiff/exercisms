class House

  def self.recite(index=0, lyrics="")
    lyrics+="This is the "
    count=index
    until count<0
      lyrics += VARIATIONS[count]
      count-=1
    end
    return lyrics if index==VARIATIONS.length-1
    lyrics+="\n"
    self.recite(index+1, lyrics)
  end

  VARIATIONS=["house that Jack built.\n", "malt\nthat lay in the ", "rat\nthat ate the ",
    "cat\nthat killed the ", "dog\nthat worried the ", "cow with the crumpled horn\nthat tossed the ",
    "maiden all forlorn\nthat milked the ", "man all tattered and torn\nthat kissed the ",
    "priest all shaven and shorn\nthat married the ", "rooster that crowed in the morn\nthat woke the ",
    "farmer sowing his corn\nthat kept the ", "horse and the hound and the horn\nthat belonged to the "]
end
