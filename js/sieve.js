Sieve = function(num){
  this.num = num
  var eligible = [...Array(this.num+1).keys()].slice(2, this.num+1)
  this.primes=findPrimes(eligible)
};

function findPrimes(group, divisor=2){
  if (group[group.length-1]/2 <= divisor){return group};
  var group = group.filter(function(value){
    return value%divisor !== 0 || value === divisor
  });
  divisor === 2 ? divisor+=1 : divisor+=2
  return findPrimes(group, divisor);
};

module.exports = Sieve;
