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






# ------------------------------------------------------------------------------------------------------------
# Class variables scope
# https://launchschool.com/lessons/d2f05460/assignments/3763

class Person
  @@total_people = 0
  
  def self.total_people # obviously class variable can be accessed with class method
    @@total_people
  end
  
  def initialize # class variable can be accessed and modified in instance method
    @@total_people += 1
  end

  def total_people # class variable can be accessed in instance method
    @@total_people
  end
end



p Person.total_people             # => 0
Person.new
Person.new
p Person.total_people             # => 2

bob = Person.new
p bob.total_people                # => 3

joe = Person.new
p joe.total_people                # => 4

p Person.total_people             # => 4
