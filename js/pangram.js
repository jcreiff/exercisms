Pangram = function(phrase){
  this.phrase=phrase.toLowerCase();
};

Pangram.prototype.isPangram = function() {
  return Array.from("abcdefghijklmnopqrstuvwxyz").every(x => this.phrase.search(x) != -1)
};

module.exports = Pangram
