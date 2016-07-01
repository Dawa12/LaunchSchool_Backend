# modules vs. inheritance: why modules rock!!

class Mammal
  def pet?
  end

  def run
  end

  def walk
  end
end

class Dog < Pet
end

class Cat < Pet5
end

# Mammal is the superclass and all of its behaviors and attributes will be available for its subclasses to call
# Using modules to group common behaviors allows us to build a more powerful, flexible and DRY design.

# doesn't make senes for you to subclass dog and fish under another superclass just so they both can have the swim method while still using inheritance. This violates the DRY principle since dog and cat have more in commmon with each other and therefore you save more code by subclassing them together

# there are behaviors and attributes that Fish does not possess that both Cat and Dog do. Therefore, by using DRY, we save on more code by sublcassing Cat and Dog together than if we subclassed Fish and Dog on a class that includes swimmable, and then add in many more methods into the Dog class, which it and Cat share. 


# classes vs objects
class Dog
  def initialize(name)
    @name = name
  end
end

rufus = Dog.new("Rufus")

# in this scenario, rufus is an object of the Dog class. It stores a unique state, the @name state, in this case. Objects allow you to  






