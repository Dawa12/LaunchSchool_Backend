require 'pry'

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    age += 1 #just age instead of self.age will return undefined method '+' for nil:Nilclass. age evaluates to nil here.
  end

  def phrase
    puts "I'm #{age} years old" # both age and self.age work. calling just age activates getter method and returns @age. 
  end
end



garfield = Cat.new('orange')
garfield.phrase
garfield.make_one_year_older

garfield.phrase

# why age evaluates to nil inside instance method yet works fine inside string interpolation? Why wont calling age just access the age getter method and return @age like it does inside the quotes. Has to do with special functions of string interpolation?
#noticed this error only happens for += method. Is it since it's not available to the Cat class? All the other methods are available though like comparison / addition. Can call getter method on comparison operators but not on += since it modifies instance variable? Can only call directly on instance variable for that


=begin------------------------------------------------------------------------------------------------------------


=end