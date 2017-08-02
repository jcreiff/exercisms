PerfectNumbers = function(){};

PerfectNumbers.prototype.classify = function(number){
  if (number<=1){
    return number===1 ? "deficient" : 'Classification is only possible for natural numbers.'
  };
  var factorSum = 1
  for (i=2; i<number; i++){
    if(number%i===0){
      factorSum+=i
    };
  };
  return number===factorSum ? "perfect" : number > factorSum ? "deficient" : "abundant"
};

module.exports = PerfectNumbers;

// this solution takes waaaaaaaaay longer (!)
// PerfectNumbers.prototype.classify = function(number){
//   if (number<=1){
//     return number===1 ? "deficient" : 'Classification is only possible for natural numbers.'
//   };
//   var factorSum = [...Array(number).keys()].filter( x => number%x===0).reduce((x,y) => x+y);
//   return number===factorSum ? "perfect" : number > factorSum ? "deficient" : "abundant"
// };
