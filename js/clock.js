Clock = function(hr, min){
  this.hours=hr;
  this.minutes=min;
};

function at(hr, min=0){
  var extraHrs = rolloverMinutes(min)
  return new Clock(hr+extraHrs, min)
};

function rolloverMinutes(num){
  return Math.floor(num/60)
};

function format(num, div){
  var formatted=(num%div)
  if (formatted<0){
    formatted+=div
  }
  if (formatted<10){
    formatted = "0" + formatted
  }
  return formatted
};

Clock.prototype.toString = function (){
  return format(this.hours, 24) + ":" + format(this.minutes, 60);
};

Clock.prototype.plus = function (minutes){
  return at(this.hours, this.minutes+minutes)
};

Clock.prototype.minus = function (minutes){
  return at(this.hours, this.minutes-minutes)
};

Clock.prototype.equals = function(otherClock){
  return this.toString()==otherClock.toString();
};

module.exports.at = at
