require 'pry'
=begin
6) Continue the 'Spike' of game after forming orchestration engine. 
Full code so far below:
6a) Tackle low hanging fruit by creating the welcome and goodbye messages 
  - Will run code in irb to make sure display_welcome_message passes, and it fails on display_board with undefined local variable or method error 
6b) display_board: experiment with outputting to screen to figure out how TTT board should look like, how many lines it should include, etc.
6c) Setup board & square classes
6d) create human_move method
6e) computer_moves method
6f) take turns: fix error of letting computer / human override previous decisions. Create Board#unmarked_keys method to only show squares that still have INITIAL_MARKER. update program to only allow players to choose from unmarked_keys
6g) Break when board is full
6h) Detect winner

=end

class Board
  attr_reader :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 6], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]
                  # nested array of winning key combinations
  def initialize
    @squares = {} # call it @squares since a Board will be composed of squares with individual states
    reset # RESET METHOD INSERTS A HASH INTO @square
    # want to set it to an Square object with marker attribute / value of INITIAL_MARKER, instead of just directly setting it to INITIAL_MARKER.
  end

  def []=(key, marker) # refactoring the set_square_at method so it reads better.
    @squares[key].marker = marker
  end

  def unmarked_keys # important to name methods well. Don't name this empty_squares, since Square is really an object. What we want are not the objects but the keys to those objects.
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full? # this reflects state of board so goes under Board class.
    unmarked_keys.empty?
  end

  def marked_keys
    @squares.keys.select { |key| @squares[key].marked? }
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.count != 3
    markers.min == markers.max # min will return value of string with first letter closest to A, while max will reutrn value of string with first letter closest to Z
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        # binding.pry
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  " # since is an instance variable, we do not have to pass in as an argument to display_board. We can call it directly from the getter method.
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end
end

class Square # I keep forgetting what @square is. It's simply a hash. Square.new = 1 => '', 2 => '' ...
  INITIAL_MARKER = ' '
  attr_accessor :marker # This belongs in Square class instead of Player class, since we're modifying the value of the Square class

  def initialize(marker = INITIAL_MARKER)
    @marker = marker # will reveal the state of each square. Whether it has been marked or is empty
  end

  def to_s
    # this goes under Square class and not under Board class since we're calling to_s on Square.new(INITIAL_MARKER) so it becomes like Square.new(INITIAL_MARKER).marker and will reveal its marker attribute

    @marker # Will call marker value upon string interpolation (since that's when to_s is implicitly called)
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  def marked?
    @marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker # duplicate of Square :marker accessor, but serves different use. Chose only to make this a reader, since don't need writer
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_accessor :board, :human, :computer

  def initialize
    @board = Board.new # will initialize object of Board class
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  def joinor(arr, arg = ", ")
   # binding.pry
    if arr.count == 1
      "#{arr[0]}"
    else
      arr[0..-2].join(arg) + " or " + "#{arr[-1]}"
    end
  end

  private

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    board.draw
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def display_goodbye_message
    puts "Thank you for playing!"
  end

  def human_moves
    puts "Choose a number: #{joinor(board.unmarked_keys, ', ')} "

    num = nil
    loop do
      num = gets.chomp.to_i # will this throw error if letter given?
      break if board.unmarked_keys.include?(num)
      puts "Sorry, please choose a valid number"
    end

    board[num] = human.marker # still confused why we let it be the board's responsibility to set square instead of giving responsibility to human, with its #mark method.
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    if board.winning_marker == TTTGame::HUMAN_MARKER
      puts "You win!"
    elsif board.winning_marker == TTTGame::COMPUTER_MARKER
      puts "Computer wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    ans = nil
    loop do
      puts "Play another round?(y/n)"
      ans = gets.chomp.downcase
      break if ans == 'y' || ans == 'n'
      puts "Please select a valid answer"
    end

    ans == 'y' # will evaluate to true or false
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
    display_play_again_message
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end
end

game = TTTGame.new
game.play
