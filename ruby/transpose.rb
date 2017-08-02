class Transpose

  def self.transpose(input)
    return "" if input=="\n"
    phrase = input.split("\n")
    longest = find_longest_row(phrase)
    answer=Array.new(longest, "")
    phrase.each do |row|
      row = append_spaces(longest, row)
      row.split("").each_with_index do |letter, index|
        answer[index]+=letter
      end
    end
    stripped = answer.map {|row| row.end_with?(" ") ? row.rstrip : row}
    stripped.join("\n")
  end

  def self.append_spaces(max, phrase)
    (max - phrase.length).times do
      phrase += " "
    end
    phrase
  end

  def self.find_longest_row(rows)
    rows.map{|row| row.length}.max
  end

end
