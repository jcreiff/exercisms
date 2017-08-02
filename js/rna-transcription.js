DnaTranscriber = function() {};

DnaTranscriber.prototype.toRna = function(strand) {
  if (strand.split("").some(x => "CGAT".search(x)==-1)) {
    throw "Invalid input"
  };
  var rnaPairs = {"C":"G", "G":"C", "A":"U", "T":"A"}
  var swaps = strand.split("").map(function(x) {
    return rnaPairs[x]
  });
  return swaps.join("");
};

module.exports = DnaTranscriber;
