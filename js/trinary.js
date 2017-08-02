Trinary = function(num){
  this.num=num
};

Trinary.prototype.toDecimal = function (){
  if (this.num.match(/\D/)){return 0};
  var values = this.num.split("").reverse().map(function(x){return parseInt(x)});
  return values.reduce(function(total, value, index){
    return total + (value * Math.pow(3, index));
  });
};

module.exports = Trinary;
