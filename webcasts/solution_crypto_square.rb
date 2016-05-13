require 'pry'

class Crypto
  def initialize(text)
    @normalized_plaintext = text.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def size
    plain_text_size = @normalized_plaintext.size
    Math::sqrt(plain_text_size).ceil
  end

  def plaintext_segments
# binding.pry
    @normalized_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext


  plain = ["zomg", "zomb", "ies"]

binding.pry

  end

end