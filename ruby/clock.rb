
class Clock

  def self.at(hours, minutes)
    formatted_minutes = format_minutes(minutes)
    formatted_hours = format_hours(hours+formatted_minutes[1])
    formatted_hours + ":" + formatted_minutes[0]
  end

  def self.format_hours(hours)
    rollover=hours%24
    rollover<10 ? "0" + rollover.to_s : rollover.to_s
  end

  def self.format_minutes(minutes)
    rollover=minutes%60
    rollover<10 ? rollover = "0" + rollover.to_s : rollover = rollover.to_s
    [rollover, minutes/60]
  end
end

class String
  def +(minutes)
    if minutes.class==String
      self.concat(minutes)
    elsif minutes.class==Fixnum
      Clock.at(self[0..1].to_i, self[3..4].to_i+minutes)
    else
      raise TypeError, "String cannot be coerced into #{minutes.class}"
    end
  end
end
