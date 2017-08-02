class Translation

  def self.of_codon(codon)
    PROTEINS[codon]
  end

  def self.of_rna(strand, result=[])
    raise InvalidCodonError, "Invalid Codon" if strand.match(/[^AUCG]/)
    return result if (strand == "" || of_codon(strand[0, 3])=="STOP")
    result<<of_codon(strand[0, 3])
    of_rna(strand[3..-1], result)
  end


  PROTEINS= {"AUG"=>"Methionine",
  "UUU"=>"Phenylalanine", "UUC"=>"Phenylalanine",
  "UUA"=>"Leucine", "UUG" =>	"Leucine",
  "UCU"=>"Serine", "UCC"=>"Serine", "UCA"=>"Serine", "UCG"=>"Serine",
  "UAU"=>"Tyrosine", "UAC"=>"Tyrosine",
  "UGU"=>"Cysteine", "UGC"=>"Cysteine",
  "UGG"=>"Tryptophan",
  "UAA"=>"STOP", "UAG"=>"STOP", "UGA"=>"STOP"}

end


class InvalidCodonError<StandardError
end
