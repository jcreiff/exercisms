ETL = function() {};

ETL.prototype.transform = function(input) {
  transformedSet={};
  Object.keys(input).forEach(function(key){
    values=input[key]
    values.forEach(function(val){
      newKey=val.toLowerCase();
      newVal=parseInt(key);
      transformedSet[newKey]=newVal;
    })
  })
  return transformedSet;
};


module.exports = ETL;
