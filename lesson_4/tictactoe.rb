require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[3, 5, 7], [1, 5, 9]]              # diagonals



# General methods

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}" unless brd.values.any? { |x| x != ' ' }
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER } # returns array of all keys that are ' '
end

def joinor(arr, arg2 = ', ', arg3 = 'or')
a = ''
  arr.each_with_index do |element, index|
    arg2 = '' if arr.count == 1 # can I refactor this method better?
    a += "#{element}#{arg2}"
    break if (index + 1) == (arr.count - 1)
  end

  if arr.count == 1
    return a
  else
    b = ("#{arg3} " + arr.last.to_s + "\n")
    return a + b
  end
end

def player_choice!(brd)
  prompt "Make your move! Choose a number: #{joinor(empty_squares(brd), ', ')}"
  square = ''

  loop do # check to see if number is valid: is empty spot, square is 1..9
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "That choice is not valid. Please enter one of the remaining valid choices: #{empty_squares(brd).join(', ')}"
  end
  brd[square] = PLAYER_MARKER
end

# def computer_choice!(brd)
#   square = empty_squares(brd).sample
#   brd[square] = COMPUTER_MARKER
# end


def computer_choice!(brd)
  if !!detect_threat?(brd)
    prompt "Computer blocks your win!!"
      # seems this prompt only toward end of game although it should have activated the first time there was a threat. 

    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end


def detect_threat?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 
      # && brd.values_at(line[0..2]).include(INITIAL_MARKER)
      return true
    else
      break
    end
  end
  # ruby returns a nil / false here automatically if i don't specify return true above?
end





# brd.keys.select { |num| brd.values_at(line[0..2]).count(PLAYER_MARKER) == 2 && brd.values_at(line[0..2]).include(INITIAL_MARKER)}

# brd.values_at(line[0..2]).replace(COMPUTER_MARKER)




# WINNING_LINES.each do |line|
#   def find_at_risk_square(line, board)
#     if board.values_at(*line).count('X') == 2
#       board.select{|k,v| line.include?(k) && v == ' '}.keys.first
#     else
#       nil
#     end
#   end
# end




def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner?(brd) # bang, bang in front of method forces a boolean as a return value: 'player' => true, 'nil' => false
end

def detect_winner?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 # '*', splat operator, is shortcut to let us pass line[0], line[1], line[2], or all the arguments within the line array
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# Methods for Scores

def initialize_scores(hsh)
  hsh['Computer'] = 0
  hsh['Player'] = 0
end

def score_5?(hsh)
  hsh['Computer'] == 5 || hsh['Player'] == 2
end

def increment_score(brd, hsh)
  winner = detect_winner?(brd)
  hsh[winner] += 1
end

def display_scores(hsh)
  prompt "The score is: Computer: #{hsh['Computer']}
                Player: #{hsh['Player']}"
end


def score_5_action(scores, board, answer2)
user_answer = ''  

  if score_5?(scores)
  prompt "Game Over, #{detect_winner?(board)} wins with 5 points!"
  prompt "Final score: " 
  display_scores(scores)
  
  prompt "Play another game till 5? ('yes' or 'no')"
    loop do
      user_answer = gets.chomp
      prompt "Thank you for your answer"
      if user_answer.downcase.start_with?('yes') || user_answer.downcase.start_with?('no')
        break
      else
        prompt "enter a valid answer"
      end
    end
    answer2.gsub!(/\s/, user_answer) # destructive substitution of the space charcter with string value of user_answer
    # any way to replace a blank variable, without a space character?
    return answer2
  end
    # chose to omit 'else' condition
end



# <-----The Program------>

loop do # main loop
prompt "Welcome to a New Game of Tic-Tac-Toe"
scores = {}
initialize_scores(scores)

board = ''
answer1 = ''
answer2 = ' '

  loop do
    board = initialize_board 
    display_scores(scores) 

    prompt "Ready to begin? Hit enter"
      loop do 
        break if gets.chomp
      end

    loop do
      sleep(2)
      display_board(board)

      player_choice!(board) 
      break if someone_won?(board) || board_full?(board)

      computer_choice!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board) 

    if someone_won?(board)
      prompt "#{detect_winner?(board)} won!"
      increment_score(board, scores)
    else
      prompt "It's a tie!"
    end

    break if score_5_action(scores, board, answer2) 
    
    prompt "Play again? Yes or no?"
    answer1 = gets.chomp

    break if answer1.downcase.start_with?('n')
  end

  p'#8 last loop'
  break if answer1.downcase.start_with?('n')
  break if answer2.downcase.start_with?('n')
end
prompt("Thanks for playing tic-tac-toe!")


















