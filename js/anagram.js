Anagram = function(word) {
  this.word=word.toLowerCase();
};

function sameLetters(word1, word2) {
  return word1.split("").sort().join("")==word2.split("").sort().join("")
}

Anagram.prototype.matches = function() {
  if (Array.isArray(arguments[0])){arguments=arguments[0]};
  var anagrams=[]
  for (i=0; i<arguments.length; i++){
    matchWord=arguments[i].toLowerCase()
    if (sameLetters(matchWord, this.word) && matchWord != this.word) {
      anagrams.push(arguments[i])
    };
  };
  return anagrams
};


module.exports = Anagram;
