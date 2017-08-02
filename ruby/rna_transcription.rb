class Complement

  def self.of_dna(strand)
    transposed = strand.split("").map{|base| PAIRS[base]}.join
    transposed.length == strand.length ? transposed : ''
  end

  PAIRS = {'C'=>'G', 'G'=>'C', 'T'=>'A', 'A'=>'U'}

end
