class SpaceAge
  attr_reader :seconds, :on_earth

  def initialize(seconds)
    @seconds=seconds
    @on_earth=seconds/31557600.0
  end

  def method_missing(planet)
    on_earth/ORBIT_LENGTHS[planet]
  end

  ORBIT_LENGTHS = {:on_mercury=>0.2408467, :on_venus=>0.61519726,
    :on_mars=>1.8808158, :on_jupiter=>11.862615, :on_saturn=>29.447498,
    :on_uranus=>84.016846, :on_neptune=>164.79132}

end
