function scoreLetter(letter){
  switch(letter) {
    case "Q":
    case "Z":
      return 10;
      break;
    case "J":
    case "X":
      return 8;
      break;
    case "K":
      return 5;
      break;
    case "F":
    case "H":
    case "V":
    case "W":
    case "Y":
      return 4;
      break;
    case "B":
    case "C":
    case "M":
    case "P":
      return 3;
      break;
    case "D":
    case "G":
      return 2;
      break;
    default:
      return 1;
  }
};

function sanitizeAndSplit(word){
  return word.toUpperCase().split("")
}

function scoreWord(letters){
  total=0
  letters.forEach(function(letter){
    total+=scoreLetter(letter);
  })
  return total
};

function scoreMultiplier(score, multiplier){
  return multiplier==="double-word" ? score * 2 : multiplier === "triple-word" ? score * 3 : score
};

module.exports = function(word, multiplier=null){
  if (word===null||word.trim()===""){return 0};
  var letters = sanitizeAndSplit(word);
  score =  scoreWord(letters);
  return scoreMultiplier(score, multiplier)
};
