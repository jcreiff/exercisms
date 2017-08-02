Hamming = function() {};

Hamming.prototype.compute = function(strand1, strand2, count=0) {
  if (strand1.length != strand2.length) {throw "DNA strands must be of equal length."};
  for (var i=0; i<strand1.length; i++) {
    if (strand1[i] != strand2[i]) {
      count+=1
    };
  };
  return count
};

module.exports = Hamming;
