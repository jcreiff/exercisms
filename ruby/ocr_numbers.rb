class OCR
  attr_accessor :text, :multiline

  def initialize(text)
    @multiline = handle_double_break(text) if text.include?("\n\n")
    @text=text.split("\n")
    @text[0].length>3 ? adjust_for_multiple : self.text=[@text]
  end

  def handle_double_break(sets)
    sets.split("\n\n").map{|set| OCR.new(set).convert}.join(",")
  end

  def adjust_for_multiple(new_set=Hash.new{|h,k| h[k]=[]})
    (0..2).each do |row|
      start=0
      until start >= text[row].length
        new_set[start]<<text[row][start..start+2]
        start+=3
      end
    end
    self.text=new_set.values
  end

  def convert
    multiline ? multiline : text.map{|set| find_number(set.map{|row| row.strip}).to_s}.join
  end

  def find_number(set)
    conversion = TEXT_LINES.index(set).to_s
    conversion.empty? ? "?" : conversion
  end

  TEXT_LINES=[["_", "| |", "|_|"], ["", "|", "|"], ["_", "_|", "|_"],
    ["_", "_|", "_|"], ["", "|_|", "|"], ["_", "|_", "_|"], ["_", "|_", "|_|"],
    ["_", "|", "|"], ["_", "|_|", "|_|"], ["_", "|_|", "_|"]]

end
