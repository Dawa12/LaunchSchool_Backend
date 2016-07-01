class Atbash
  ALPHABETH = ('a'..'z').to_a

  def self.encode(letters)
    result = ''
    arr = letters.gsub(/[^a-zA-Z0-9]/, '').chars

    arr.each do |letter|
      if letter.to_i != 0
        result << letter
        next
      else
        inx = -(ALPHABETH.index(letter.downcase)) - 1
        result << ALPHABETH[inx]
      end
    end

    result.size >= 5 ? result.scan(/.{1,5}/).join(' ') : result
  end
end
