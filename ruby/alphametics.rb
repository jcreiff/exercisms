# This works, but it takes about 2 minutes for all the tests to run.

class Alphametics
  attr_reader :letters, :words, :first_letters_index

  def initialize(puzzle)
    @words=puzzle.split(" ").reject{|char| char.match(/\W/)}
    @letters=puzzle.split("").uniq.reject{|char| char.match(/\W/)}.sort
    @first_letters_index=@words.map{|word| word[0]}.map{|letter| @letters.index(letter)}
  end

  def solve
    make_hash((0..9).to_a.permutation(letters.count).reject{|set| first_letters_index.any?{|index| set[index]==0}}.find{|set| substitute(make_hash(set))})
  end

  def make_hash(values, hash=Hash.new)
    return hash if values.nil?
    letters.each_with_index {|letter, i| hash[letter]=values[i]}
    hash
  end

  def substitute(values)
    test_values = words.map{|word| word.split("").map{|letter| values[letter]}.join}.map(&:to_i)
    test_values[0..-2].reduce(:+)==test_values[-1]
  end

  def self.solve(puzzle)
    Alphametics.new(puzzle).solve
  end

end
