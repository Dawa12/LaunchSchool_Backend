=begin
1) General Game Description 
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns
marking a square. The first player to mark 3 squares in a row wins.

2) List nouns and verbs
Nouns: board, player, square, grid
Verbs: play, mark

3) Organize nouns with corresponding verbs
Board
Square
Player
- mark
- play

=end

# 4) Spike and explore the code.
    # Comment ideas for possible attributes / states needed upon instantiation of class

class Board
  def initialize
    # we need some way to model the 3x3 grid. Maybe "squares"?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

def Square
  def initialize
    # maybe a 'status' attribute to keep track if square has been marked or not
  end
end

def Player
  def initialize
    # create computer and person subclasses
    # maybe a "marker" to keep track of this player's symbol (ie, 'X' or 'O')
  end

  def mark

  end

  def play

  end
end

# Orchestration engine to handle game flow:

class TTTGame
  def play

  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play

# 5) Flesh out the sequence of the TTTGame#play method by invoking the methods that we wished existed

class TTTGame
  def play
    display_welcome
    loop do
      display_board
      first_player_moves
      break if someone_one? || board_full?

      second_player_moves
      break if someone_one? || board_full?    
    end
    display_result
    display_goodbye
  end
end

# 6) Continue the 'Spike' of game after forming orchestration engine. 
# Full code so far below:
# 6a) Tackle low hanging fruit by creating the welcome and goodbye messages 

class Board
  def initialize
  end
end

class Square
  def initialize
  end
end

class Player
  def initialize
  end

  def mark
  end
end

class TTTGame
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def display_goodbye_message
    puts "Thank you for playing!"
  end
end





















