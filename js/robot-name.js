NameCollector=function(){
  this.collection=[];
};

names = new NameCollector();

Robot = function() {
  this.name = makeName();
  this.reset = reset;

  function makeName() {
    var newName = randomLetters() + randomNumbers()
    if (names.collection.indexOf(newName)!==-1) {
      return makeName();
    }
    else{
      names.collection.push(newName);
      return newName
    }
  };

  function reset(){
    this.name=makeName();
  };

  function randomLetters() {
    var alpha = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
      "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    random1 = alpha[Math.floor(Math.random()*26)];
    random2 = alpha[Math.floor(Math.random()*26)];
    return random1+random2
  };

  function randomNumbers() {
    return Math.random().toString().substring(2,5)
  };
};

module.exports = Robot;
