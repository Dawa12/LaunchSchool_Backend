# RPS with OOP approach

=begin
The classical approach to object oriented programming is:
1) Write a textual description of the problem or exercise.
2) Extract the major nouns and verbs from the description.
3) Organize and associate the verbs with the nouns.
4) The nouns are the classes and the verbs are the behaviors or methods.


1) Write a textual description of the problem or exercise.

Rock, Paper, Scissors is a game where a player and computer each choose piece. The chosen pieces are compared and a winner is decided according to the following rules:

  - Rock beats Scissors
  - Scissors beats Paper
  - Paper beats Rock

If both players select the same move, it's a tie


2) Extract the major nouns and verbs from the description.
nouns (classes): player(person/computer), move(rock, paper, scissors), rule
verbs (behaviors / instance methods): choose, compare (behaviors that the objects / nouns can perform)


3) Organize and associate the verbs with the nouns.

Player
  - choose (players can choose, meaning they can select pieces)
Move (rock, paper, or scissors)
Rules 

- compare (dont' know yet where this will go)

=end

# With above outline, u can code up some logic, you can code up some more details. While we do this, we can also think about what "states" the objects of these classes should have.




class Player
  def initialize 
    # set a name attribute? 
  end

  def choose
    
  end
end


class Move
  def initialize
    # move object can be rock, paper, or scissor
  end
end

class Rules
  def initalize
    # not sure what the state of rule object should be 
  end

end

# not sure where compare will go yet.
def compare(move1, move2)
end


# Orchestration Engine: to map out procedural program flow
#  Let's call the "engine" class RPSGame. We want an easy interface to kick things off, so perhaps to play the game, we just instantiate an object and call a method called play, like this:

RPSGame.new.play 

class RPSGame # within this class, we can map out the logic and flow of the game. When a new object in this class is instantiated, we assume that starts a new game. 
  def initialize
  end

  def play
  end

end

# Starting from that skeleton, we can start to think about what objects are required in the play method to facilitate the game.



class RPSGame
  def initialize
  end

  def play
    display_welcome_message
    human_choose_move
    computer_choose_move
    display_winner
    display_goodbye_message
  end

end

#Lines 3 and 4 look similar, and it also looks like there's a redundant "choose_move" part. This ties into our Player class, which has a choose method. What if "human" and "computer" were both objects of the Player class? They'd both immediately have the Player#choose method. With that insight, we update the RPSGame class definition:

class RPS
  attr_accessor :human, :computer
  def initialize
    @human = Player.new
    @computer = Player.new
      # when we begin a new game, we'll create new objects from the Player class and assign them to instance variables @human and @computer
  end

  def play
    display_welcome_message
    human.choose # human getter method will return @human and apply the choose method to it.
    player.choose
    display_winner
    display_goodbye_message
  end
end


RPSGame.new.play




























