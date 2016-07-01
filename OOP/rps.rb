require 'pry'

class Move # act as a collaborator between Human and Computer 
  attr_accessor :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  DISPLAY_VALUES = [VALUES[0, 4] + ['or'] +[VALUES[-1]]].join(', ')

  def initialize(value)
    @value = value # reassigns @value, which was originally nil (since it was created through attr_accessor) to now be the passed in parameter. 
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def scissors?
    value == 'scissors'
  end

  def lizard?
    value == 'lizard'
  end

  def spock?
    value == 'spock'
  end


  def >(other_move) 
    # remember that we're calling the greater than operator on an object of Move. Since @move stores that instance of Move, when we're doing human.move > computer.move, the > operator is really just a method, like move.>(computer.move) The > operator accepts one paramter, which we will call other_move in this method definition.
    # the entire purpose of creating the Move class is so that we can redefine the logic the > operator uses to return a boolean value. Thus, we are able to compare objects, since the strings are properly encapsulated within the > method.

      (rock? && other_move.scissors?) ||
        # don't have to prepend 'self', since > method is instance method and will already be called on self. 
        (paper? && other_move.rock?) ||
        (scissors? && other_move.paper?)
        (rock? && other_move.lizard?) ||
        (paper? && other_move.spock?) ||
        (scissors? && other_move.lizard?)
        (lizard? && other_move.paper?) ||
        (lizard? && other_move.spock?) ||
        (spock? && other_move.scissors?) ||
        (spock? && other_move.rock?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
      (rock? && other_move.spock?) ||
      (paper? && other_move.lizard?) ||
      (scissors? && other_move.spock?)
      (lizard? && other_move.rock?) ||
      (lizard? && other_move.scissors?) ||
      (spock? && other_move.paper?) ||
      (spock? && other_move.lizard?)
  end

  def to_s #overriding to_s, which is called in string interpolation, so that human.move will show the actual string value instead of just the object.
    @value
  end
end

class Player
  attr_accessor :move, :name, :score # when using accessor, instance variable also created and set to nil

  def initialize
    set_name # generally not a good idea to include logic in initialize method, so will encapsulate that logic into set_name method
    @score = 0
  end

end

# Instead of having set_name and choose methods with conditional within them, better to break out two different classes for Human and Computer and place appropriate behaviors in their own methods. 

class Human < Player
  def set_name
    puts "Please enter your name"
    answer = nil
    loop do 
      answer = gets.chomp
      break unless answer.empty?
    end
    self.name = answer
    puts "Welcome #{name}! Good luck in the game!"
  end

  def choose
    puts "A new game..."
    choice = nil # better to initialize to nil rather than empty string or array
    loop do
      puts "Please choose #{Move::DISPLAY_VALUES}"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice. Please make a valid choice"
    end
    self.move = Move.new(choice)
      # move was nil, since the time we created it with attr_accessor. Now we have reassigned the value of @move to point to a new instance of the Move class, with all its states and behaviors. 
      # What's really confusing is that we use the same name so many times. We are setting the move instance variable to a new object of the Move class. But at the same time, it's probably helpful, since the variables are appropriately named to their corresponding classes. 
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Sonny', 'Watson'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample) # instantiating a new Move object and using the getter method to store the new object to @move
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :winner # will create 4 instance methods: 2 getters, 2 setters. And will create 2 instance varialbes: @human, @computer, and set them to nil
  def initialize
    @human = Human.new # reassigns @human instance variable from human to new instance of Human class. @human instance variable now has all attributes and behaviors of Human, and it's paent class Player
    @computer = Computer.new
  end

  def play
    loop do
      display_welcome_message
      
      # play till 3 points

      display_scores
      human.choose # we access the choose method, a behavior available to Human class.
        # since we're returning a value with choose (the rock, paper, or scissors), we must store that value somewhere. That implies that we're modifying a value somewhere, so we'll have to create a Human class to store that instance variable and assingn it to the return value of choose. 
      computer.choose
      display_moves
      display_winner
      if score_3?
        case play_from_0?
          when true then next
          when false then break
        end
      else
        break unless play_again?
      end
    end
    display_goodbye_message
  end

  def display_welcome_message
    "Welcome to RPS!"
  end

  def display_scores
    if score_3?
      reset_scores
      puts "Reset scores! First to 3 wins!"
    end
    puts "<------Scoreboard------>"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_winner
    if human.move > computer.move
       # must create a 'move' object instead of just setting it to a string. As an object, you can compare it to another instance of itself
      human.score += 1
      self.winner = human.name
      puts "#{human.name} won!"
      puts "#{human.name} has a new score of #{human.score}!"
    elsif human.move < computer.move
      computer.score += 1
      self.winner = computer.name
      puts "#{computer.name} won!"
      puts "#{computer.name} has a new score of #{computer.score}!"
    else
      puts "It's a tie!"
    end
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def score_3?
    human.score == 3 || computer.score == 3
  end

  def play_from_0?
    puts "Game over! #{winner} won! Play another few games? First to 3 wins... (yes/no)"

    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['yes', 'no'].include?(answer)
      puts "Please enter a valid response"
    end

    return false if answer == 'no'
    return true if answer == 'yes'
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
      # applying the human getter method to access the @human instance variable, which is really just pointing to a new instance of the Human class, with all its attributes and behaviors. We call human.name, so we're calling the name instance method which is available for us via the Human class. 
    puts "#{computer.name} chose #{computer.move}"
  end

  def play_again?
    puts "Game over, play another round? (yes / no)"
    answer = nil
    loop do
      answer = gets.chomp
      break unless answer.empty?
        puts "Invalid anwer. Please try again"
    end
     
     return true unless answer.downcase == 'no'
  end
end

RPSGame.new.play


