Raindrops = function(){};

var drops = {3: "Pling", 5: "Plang", 7: "Plong"}

Raindrops.prototype.convert=function(num, response=""){
  Object.keys(drops).forEach(function(key){
    if (num%key===0){response+=drops[key]};
  });
  return response === "" ? num.toString() : response
};

module.exports = Raindrops;
