# Constants

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
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, arg = ', ', arg1 = 'or')
  insert_comma = ''

  arr.each_with_index do |element, index|
    arg = '' if arr.count == 1
    insert_comma += "#{element}#{arg}"
    break if (index + 1) == (arr.count - 1)
  end

  if arr.count == 1
    return insert_comma
  else
    insert_or = ("#{arg1} " + arr.last.to_s + "\n")
    return insert_comma + insert_or
  end
end

def player_choice!(brd)
  prompt "Make your move! Choose a number: #{joinor(empty_squares(brd), ', ')}"
  square = ''

  loop do
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "That choice is not valid. Please enter one of the remaining valid choices: #{empty_squares(brd).join(', ')}"
  end
  brd[square] = PLAYER_MARKER
end

def computer_choice!(brd)
  square = nil

  # Offensive win
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # Defensive block
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # choosing square 5
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  # Random move
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else # else without condition evaluates to nil
  end
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner?(brd)
end

def detect_winner?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
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
  prompt <<-scores1
The score is: Computer: #{hsh['Computer']}
                   Player: #{hsh['Player']}
  scores1
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
    answer2.gsub!(/\s/, user_answer) # destructive substitution of the space character with string value of user_answer
    return answer2
  end
end

def alternate_player(current_player)
  return 'computer' if current_player == 'player'
  return 'player' if current_player == 'computer'
end

def place_piece!(brd, current_player)
  if current_player == 'computer'
    computer_choice!(brd)
  else
    player_choice!(brd)
  end
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
    current_player = 'player'
    board = initialize_board
    display_scores(scores)

    prompt "Ready to begin? Hit enter"
    loop do
      break if gets.chomp
    end

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
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

  break if answer1.downcase.start_with?('n')
  break if answer2.downcase.start_with?('n')
end
prompt("Thanks for playing tic-tac-toe!")
