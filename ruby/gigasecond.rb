class Gigasecond

  def self.from(birth)
    Time.at(birth.to_i+1000000000)
  end
end
