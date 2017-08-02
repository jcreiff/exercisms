class Scale
  attr_reader :root, :mode, :all_notes_flat, :all_notes_sharp, :steps, :notes_in_key

  def initialize(root, mode, steps="mmmmmmmmmmm")
    @root = sanitize_root(root)
    @mode = mode
    @all_notes_sharp = %w(C C# D D# E F F# G G# A A# B)
    @all_notes_flat = %w(C Db D Eb E F Gb G Ab A Bb B)
    @notes_in_key = []
    @steps=steps
  end

  def name
    root + " " + mode.to_s
  end

  def sanitize_root(root)
    chars = root.split("")
    chars[0].upcase!
    chars.join
  end

  def pitches
    uses_flats? ? find_notes(all_notes_flat) : find_notes(all_notes_sharp)
  end

  def uses_flats?
    ["Db", "Eb", "F", "Gb", "Ab", "Bb"].include?(root) || mode==:locrian || mode==:harmonic_minor
  end

  def find_notes(notes)
    notes.rotate!(notes.index(root))
    map_steps(notes)
    notes_in_key.compact
  end

  def map_steps(notes)
    indexes_of_key = [0]
    count = 0
    steps.split("").each do |next_note|
      count+=intervals[next_note]
      indexes_of_key<<count
    end
    indexes_of_key.each do |index|
      notes_in_key<<notes[index]
    end
  end

  def intervals
    {"m"=>1, "M"=>2, "A"=>3}
  end
end
