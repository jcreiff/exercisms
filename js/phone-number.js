PhoneNumber = function(input) {
  var digitsOnly = input.replace(new RegExp(/\D/, "g"), "")
  this.number = validateNumber
  this.areaCode = findAreaCode
  this.toString = formatNumber

  function validateNumber() {
    if (digitsOnly.length>11 || digitsOnly.length<10){
      return "0000000000"
    }
    else if (digitsOnly.length==11) {
      return digitsOnly.charAt(0) == 1 ? digitsOnly.slice(1,11) : "0000000000"
    }
    else {
      return digitsOnly
    };
  };

  function findAreaCode() {
    return validateNumber().slice(0,3)
  };

  function formatNumber() {
    return "(" + findAreaCode() + ") " + validateNumber().slice(3, 6) + "-" + validateNumber().slice(6, 10)
  };
};

module.exports = PhoneNumber;
