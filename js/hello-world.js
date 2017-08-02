HelloWorld = function() {};

HelloWorld.prototype.hello = function(name) {
  return "Hello, ".concat(name == "" ? "World" : name).concat("!")
};


module.exports = HelloWorld;
