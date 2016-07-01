require 'pry'
=begin------------------------------------------------------------------------------------------------------------

=end



=begin------------------------------------------------------------------------------------------------------------
Ruby Foundations: Blocks https://launchschool.com/lessons/c0400a9c/assignments/3796

=end

def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

puts increment(3)
puts increment(3) do |number| # realizing how to better recognize block arguments. You can only yield with a parameter when the block you're calling accepts an argument 
  puts number
end


