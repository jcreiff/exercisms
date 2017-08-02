Allergies = function(score){
  this.score = score;
  this.list = findAllergies
};

var scoreMap = {1:'eggs', 2:'peanuts', 4:'shellfish', 8:'strawberries',
  16:'tomatoes', 32:'chocolate', 64:'pollen', 128:'cats'}

function findAllergies(){
  var totalScore = sanitize(this.score)
  var allergens = []
  Object.keys(scoreMap).reverse().forEach(function(key){
    if (totalScore-key>=0){
      allergens.unshift(scoreMap[key])
      totalScore-=key
    }
  });
  return allergens
};

function sanitize(score){
  return score%256
}

Allergies.prototype.allergicTo = function(allergen){
  console.log(this)
  return this.list().includes(allergen)
};

module.exports = Allergies;
