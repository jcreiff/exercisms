Triangle = function(side1, side2, side3) {
  this.side1 = side1
  this.side2 = side2
  this.side3 = side3
};

Triangle.prototype.kind = function() {
  let sides = [this.side1, this.side2, this.side3].sort(function(a, b) {return a - b});
  if (sides[2] >= sides[0] + sides[1]) {
    throw "Invalid triangle"
  }
  else if (sides[0]==sides[1] && sides[1]==sides[2]) {
    return "equilateral"
  }
  else if (sides[0]==sides[1] || sides[0]==sides[2] || sides[1]==sides[2]) {
    return "isosceles"
  }
  else {
    return "scalene"
  };
};

module.exports = Triangle;
