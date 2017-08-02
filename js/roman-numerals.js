var DIGITS = { 1000:"M", 900:"CM", 500:"D", 400:"CD", 100:"C", 90:"XC",
    50:"L",  40:"XL", 10:"X", 9:"IX", 5:"V", 4:"IV", 1:"I"}

module.exports = function(arabic) {
  var numerals = []
  Object.keys(DIGITS).reverse().forEach(function(key){
    if (arabic>=key){
      var div = Math.floor(arabic/key)
      for(i=1; i<=div; i++){
        numerals.push(DIGITS[key])
      };
      arabic = arabic%key
    };
  })
  return numerals.join("")
};
