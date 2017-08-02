Series = function(digits){
  this.digits=separateDigits(digits);
};

function separateDigits(digits){
  var separated = digits.split("")
  var transformed = separated.map(function(num){
    return parseInt(num, 10);
  });
  return transformed;
};

Series.prototype.slices = function(size, output=[]){
  if (size>this.digits.length){
    throw ('Slice size is too big.');
  };
  for (i=0; i+size<=this.digits.length; i++){
    output.push(this.digits.slice(i, i+size));
  };
  return output
};

module.exports = Series;
