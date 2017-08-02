class Game
  attr_reader :frames
  attr_accessor :frame_count, :total_score

  def initialize
    @frames=Hash.new([])
    @frame_count=1
    @total_score=0
  end

  def score
    raise Game::BowlingError if frames.count < 10
    frames.each do |frame, pins|
      check_exceptions(pins)
      check_tenth_frame(pins) if frame == 10
      spare?(pins) ? score_spare(frame, pins) : strike?(pins) ? score_strike(frame, pins) : score_regular(pins)
    end
    total_score
  end

  def score_regular(pins)
    self.total_score += pins.reduce(:+)
  end

  def spare?(pins)
    pins.length == 2 && pins.reduce(:+)==10
  end

  def score_spare(frame, pins)
    frame >= 10 ? score_regular(pins) : self.total_score += (10 + frames[frame+1].first)
  end

  def strike?(pins)
    pins.length == 1 && pins.reduce(:+)==10
  end

  def score_strike(frame, pins)
    if frame >= 10
      score_regular(pins)
    else
      self.total_score += (10 + frames[frame+1].reduce(:+))
      self.total_score += frames[frame+2].first if frames[frame+1] == [10]
    end
  end

  def roll(pins)
    frames[frame_count]==[] ? frames[frame_count]=[pins] : frames[frame_count]<<pins
    self.frame_count += 1 if frames[frame_count].length > 1 || frames[frame_count].reduce(:+) == 10
  end

  def check_exceptions(pins)
    raise Game::BowlingError if pins.any? {|pin| pin < 0 || pin > 10} || pins.reduce(:+) > 10
  end

  def check_tenth_frame(pins)
    raise Game::BowlingError if strike?(pins) && (frames[11] == [] || frames[11] == [10] && frames[12]==[])
    raise Game::BowlingError if spare?(pins) && frames[11] == []
    raise Game::BowlingError if (!strike?(pins) && !spare?(pins)) && frames[11] != []
  end

  class BowlingError<StandardError
  end

end
