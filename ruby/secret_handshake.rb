class SecretHandshake
  attr_reader :commands

  def initialize(num)
    @commands=to_binary(num)
  end

  def to_binary(num, handshake=[])
    return handshake if num.class != Fixnum
    [16,8,4,2,1].each_with_index do |i, index|
      if num-i >= 0
        handshake.unshift(ACTIONS[index])
        num-=i
        break if num==0
      end
    end
    handshake.last=="reverse" ? handshake[0...-1].reverse : handshake
  end

  ACTIONS=["reverse", "jump", "close your eyes", "double blink", "wink"]

end
