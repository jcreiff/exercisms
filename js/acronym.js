function parse(phrase) {
  var words = splitWords(phrase);
  return findLetters(words)
};

function splitWords(phrase){
  return phrase.split(/[\s|-]/);
};

function findLetters(words){
  var acronymLetters = []
  words.forEach(function(word){
    acronymLetters.push(word.charAt(0).toUpperCase())
    if (word.toUpperCase()!==word){
      var uppers = word.substr(1).replace(/[^A-Z]/g, '')
      acronymLetters.push(uppers)
    }
  })
  return acronymLetters.join("")
};

module.exports.parse = parse;
