SpaceAge=function(seconds){
  this.seconds=seconds;
  this.onEarth=function(){return roundTwoDigits(this.seconds/31557600)}
};

SpaceAge.prototype.onMercury=function(){return roundTwoDigits(this.onEarth()/0.2408467)};
SpaceAge.prototype.onVenus=function(){return roundTwoDigits(this.onEarth()/0.61519726)};
SpaceAge.prototype.onMars=function(){return roundTwoDigits(this.onEarth()/1.8808158)};
SpaceAge.prototype.onJupiter=function(){return roundTwoDigits(this.onEarth()/11.862615)};
SpaceAge.prototype.onSaturn=function(){return roundTwoDigits(this.onEarth()/29.447498)};
SpaceAge.prototype.onUranus=function(){return roundTwoDigits(this.onEarth()/84.016846)};
SpaceAge.prototype.onNeptune=function(){return roundTwoDigits(this.onEarth()/164.79132)};

function roundTwoDigits(num){
  return parseFloat(num.toFixed(2));
}

module.exports=SpaceAge;
