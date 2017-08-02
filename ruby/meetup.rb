class Meetup
  attr_reader :month, :year, :dates

  def initialize(month, year)
    @month=month
    @year=year
    @dates=[]
  end

  def day(day_of_week, occurrence)
    find_date(day_of_week, ranges[occurrence])
  end

  def days_of_week
    {:sunday=>0, :monday=>1, :tuesday=>2, :wednesday=>3, :thursday=>4, :friday=>5, :saturday=>6}
  end

  def ranges
    {:teenth=>(13..19), :first=>(1..7), :second=>(8..14), :third=>(15..21), :fourth=>(22..28), :last=>last_ranges}
  end

  def last_ranges
    [4,6,9,11].include?(month) ? (24..30) : month == 2 ? (Date.new(year).leap? ? (23..29) : (22..28)) : (25..31)
  end

  def find_date(dow, range)
    range.each do |day|
      dates<<Date.new(year, month, day)
    end
    dates.select{|date| date.wday==days_of_week[dow]}[0]
  end
end
