Words = function(){};

Words.prototype.count = function(phrase) {
  words = sanitize(phrase)
  return wordCount(words);
};

function sanitize(phrase){
  return phrase.toLowerCase().replace(/(?!('t|'s))\W/g, " ").split(/\s+/).filter(x=>x!=="");
};

function wordCount(words){
  set = {};
  words.forEach(function(word){
    set[word]===undefined ? set[word]=1 : set[word]+=1
  })
  return set
};

module.exports = Words;
