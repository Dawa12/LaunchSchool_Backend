class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.sort.select do |anagram|
      next if [@word, @word.capitalize, @word.upcase].include?(anagram)
      anagram.downcase.chars.sort == @word.downcase.downcase.chars.sort
    end
  end
end