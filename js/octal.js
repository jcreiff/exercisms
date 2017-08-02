Octal = function(digits) {
  this.digits = digits
};

Octal.prototype.toDecimal = function(){
  if (this.digits.match(/[^0-7]/)){return 0};
  numbers = this.digits.split("").reverse().map(function(num, index){
    return parseInt(num) * (Math.pow(8, index))
  });
  return numbers.reduce(function(x,y){return x+y});
}

module.exports = Octal;
