=begin
Nouns & verbs of OO program:
- Buffer
- Element
- Client
  - Can read / remove
  - Can write / add elements to buffer
=end

require 'pry'

class CircularBuffer
  BufferEmptyException = "This buffer is empty!"
  BufferFullException = "Buffer is full! Cannot add that string"
  attr_accessor :buffer

  def initialize(num)
    @buffer = []
    num.times {|i| buffer << []}
    @buffer
  end

  def read
# binding.pry
    buffer.flatten.empty? ? (raise BufferEmptyException) : buffer.detect{|array| !array.empty? }.pop
  end

  def write(string)
    if string.nil?
      nil
    elsif buffer.detect {|array| array.empty? } == nil
      raise BufferFullException
    elsif buffer.flatten.empty?
      buffer.detect {|array| array.empty? } << string
    elsif !buffer.flatten.empty?
      return (buffer << [string]) if find_position.nil?
      buffer[find_position] << string
    end
# binding.pry
  end

  def write!(string)
# binding.pry
    return nil if string.nil?
    return write(string) if find_position.nil?
    buffer.each_with_index do |ele, index|
binding.pry
      break if buffer[index + 1].nil?
      return write(string) if !ele[index].empty? && buffer[index+1].empty?
    end
    buffer.detect{|array| !array.empty? }.pop
    write(string)
  end



  def clear
    buffer.detect{|array| !array.empty? }.pop until buffer.flatten.empty?
  end

  def find_position
    temp = buffer.index { |x| !x.empty? }
    return nil if buffer[temp + 1].nil?
    loop do 
      (return temp + 1) if buffer[temp] && buffer[temp + 1].empty?
      temp += 1
    end
  end

end

# iterate over elemeents and see if not empty? 
  # if not empty, see if any elements after it not not empty
  # if condition holds true, then return write(string)

















