class CircularBuffer<Array
  attr_reader :size

  def initialize(size)
    @size=size
  end

  def read
    raise CircularBuffer::BufferEmptyException, "Empty!" if self.count==0
    self.shift
  end

  def write(element)
    raise CircularBuffer::BufferFullException, "Buffer Full!" if self.count==size
    self.push(element)
  end

  def write!(element)
    if self.count<size
      write(element)
    else
      self.shift
      self.push(element)
    end
  end

  class BufferEmptyException<StandardError
  end

  class BufferFullException<StandardError
  end
end
