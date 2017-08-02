class Nucleotide
  def self.from_dna(strand)
    raise ArgumentError, "Invalid DNA Strand" if strand.match(/[^ACTG]/)
    strand.dup.split("")
  end
end

class Array
  def histogram(counts={'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0})
    uniq.each do |base|
      counts[base]=self.count(base)
    end
    return counts
  end
end
