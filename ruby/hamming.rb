class Hamming

  def self.compute(strand1, strand2, distance=0)
    raise ArgumentError, "Strands must be of equal length" if strand1.length != strand2.length
    strand1.split("").each_with_index do |base, index|
      distance+=1 if base != strand2.split("")[index]
    end
    distance
  end
end
