Bob = function() {};

Bob.prototype.hey = function(statement) {
  if (statement.trim()=="") {
    return "Fine. Be that way!"
  }
  else if (statement.toUpperCase() == statement && statement.toLowerCase() != statement) {
    return "Whoa, chill out!"
  }
  else if (statement.charAt(statement.length-1)=="?") {
    return "Sure."
  }
  else {
    return "Whatever."
  };
};

module.exports = Bob
