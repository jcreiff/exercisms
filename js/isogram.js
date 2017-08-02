Isogram = function(phrase) {
  this.phrase=phrase.toLowerCase().replace(new RegExp(/\W/, 'g'), function(match) {
    return match.toLowerCase() == match.toUpperCase() ? "" : match
  })
};

Isogram.prototype.isIsogram = function() {
  return this.phrase.split("").every(x => this.phrase.indexOf(x)==this.phrase.lastIndexOf(x))
};

module.exports = Isogram;
