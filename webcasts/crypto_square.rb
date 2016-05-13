require 'pry'

class Crypto
  attr_accessor :crypto
  include Math

  def initialize(string)
    @crypto = string
  end

  def normalize_plaintext
    crypto.gsub(/\W+/, '').downcase
  end

  def size
# binding.pry
    self.crypto = normalize_plaintext

    if sqrt(crypto.size) % 1 != 0 # is non perfect square
      sqrt(crypto.size).ceil
    else
      sqrt(crypto.size)
    end
  end

  def plaintext_segments
    self.crypto = normalize_plaintext
    start = 0
    arr = []
  # binding.pry
    until start >= crypto.size
      arr << crypto.slice(start, size)
      start += size
    end

    return arr
  end

  def ciphertext
    temp = ""
    iterator = 0

    until iterator > plaintext_segments.first.size
# binding.pry
      plaintext_segments.size.times do |num|
        temp += (plaintext_segments[num][iterator].nil? ? '' : plaintext_segments[num][iterator])
      end
 
      iterator += 1
    end

    return temp
  end

  def normalize_ciphertext
  ciphertext

    # plaintext_segments
binding.pry
    ciphertext.gsub(/(.{#{sqrt(crypto.size).floor}})/, '\1 ').strip
  end

end
  
=begin

# last element of plaintext_segments doesn't match second to last element in size. If different sizes, then another logic to be performed to try to split the elements as evenly as possible. 

ciphertext
=> "msemoaanindninndlaetltshui"

plaintext_segments
=> ["madnes", "sandth", "enillu", "minati", "on"]

expected: "msemo aanin dnin ndla etlt shui"
actual:   "msemo aanin dninn dlaet ltshu i"

crypto


Questions:
- why when I call size, it automatically calls the Crypto#size mehtod, but when I call crypto.size, it tries to call String#size and give error? 

=end


ciphertext = "msemoaanindninndlaetltshui"
crypto = "madnessandthenillumination"
ciphertext[5..-1].split('').detect{|element| element == crypto[1]}
























