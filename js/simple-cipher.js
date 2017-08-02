Cipher=function(key){
  this.key = checkValidity(key)
  this.encoding = getPositions(this.key);
};

function checkValidity(key){
  if (key==undefined){return 'bbbbbbbbbb'}
  else if (key.toUpperCase()==key){throw("Bad key")}
  else {return key};
};

function getPositions(text){
  return text.split("").map(function(letter){return alpha.indexOf(letter)})
}

Cipher.prototype.encode = function(text){
  var original = getPositions(text);
  var encoding = this.encoding;
  var transformed = original.map(function(value, index){
    return alpha[(value+encoding[index])%26]
  });
  return transformed.join("")
};

Cipher.prototype.decode = function(text){
  var original = getPositions(text);
  var encoding = this.encoding;
  var transformed = original.map(function(value, index){
    return alpha[(value-encoding[index]+26)%26]
  });
  return transformed.join("")
};

var alpha = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

module.exports = Cipher;
