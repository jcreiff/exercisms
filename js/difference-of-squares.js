Squares = function(range){
  this.range = [...Array(range).keys()].map(function(num){return num+1});
  this.sum = this.range.reduce(function(x,y){return x+y})
  this.squares = this.range.map(function(x,y){return x*x})
  this.squareOfSums = Math.pow(this.sum, 2)
  this.sumOfSquares = this.squares.reduce(function(x,y){return x+y})
  this.difference = this.squareOfSums - this.sumOfSquares
};

module.exports = Squares;
