function fore (num, factors=[]){
  if(num===1){return factors};
  for (i=2; i<=num; i++){
    if (num%i===0){
      factors.push(i)
      return fore(num/i, factors);
    };
  };
};

module.exports.fore = fore;
