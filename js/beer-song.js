BeerSong = function() {};

BeerSong.prototype.verse = function (num, str="") {

  function numBottles(num) {
    if (num == -1){return "99 bottles of beer"}
    else if (num == 0){return "No more bottles of beer"}
    else if (num == 1){return "1 bottle of beer"}
    else {return num + " bottles of beer"}
  };

  function firstLine(bottles) {
    return bottles + " on the wall, " + bottles.toLowerCase() + ".\n"
  };

  function lastLine(num, str="") {
    if (num == 0) {str += "Go to the store and buy some more, "}
    else if (num == 1) {str += "Take it down and pass it around, "}
    else {str += "Take one down and pass it around, "};
    return str + numBottles(num-1).toLowerCase()
  };

  return firstLine(numBottles(num)) + lastLine(num) + " on the wall.\n"
};

BeerSong.prototype.sing = function (start, stop=0, string="") {
  for (i=start; i>=stop; i--) {
    string+=new BeerSong().verse(i)
    if (i != stop){string+="\n"};
  };
  return string
};

module.exports = BeerSong;
