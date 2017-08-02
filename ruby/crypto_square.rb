class Crypto
  include Math

  def initialize(text)
    @text=text
  end

  def normalize_plaintext
    @text.downcase.gsub(/\W/, "")
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    segments = []
    normalized=normalize_plaintext
    segments<<normalized.slice!(0...size) until segments.length==size-1
    segments<<normalized unless normalized==""
    segments
  end

  def ciphertext
    cipher = ""
    segments=plaintext_segments
    size.times do
      segments.each do |line|
        cipher+=line.slice!(0) unless line==""
      end
    end
    cipher
  end

  def normalize_ciphertext
    segments = []
    normalized=ciphertext
    remainder=normalized.length%size
    if remainder==0
      segments<<normalized.slice!(0...size-1) until segments.length==size
    else
      segments<<normalized.slice!(0...size-1) until segments.length==remainder
      segments<<normalized.slice!(0...size-2) until normalized==""
    end
    segments.join(" ")
  end
end
