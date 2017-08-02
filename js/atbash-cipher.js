module.exports.encode = function(message, output="", count=0){
  var sanitized = lowerAndStrip(message);
  sanitized.split("").forEach(function(letter){
    count+=1
    letter.match(/\d/) ? output+=letter : output+=swapLetters(letter);
    if (count%5==0){output+=" "};
  })
  return output.trim()
};

function lowerAndStrip(text){
  return text.replace(/\W/g, "").toLowerCase()
}

function swapLetters(letter){
  var index = alpha.indexOf(letter)
  return alpha.reverse()[index]
}

var alpha = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
