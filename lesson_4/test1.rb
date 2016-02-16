require 'pry'


# scores = {}

# def initialize_scores(scores)
#   scores['Computer'] = 0
#   scores['Player'] = 0
# end

# def increment_score(winner = detect_winner?(brd))
#   scores['winner'] += 1
# end

# def scores_5?
#   scores['Computer'] == 5 || scores['Player'] == 5
# end

# if score_5?
#   puts "GAME OVER: The winner of the tournament is #{scores.key(5)}"
#   puts "Play another round till 5? (Y/N)"
#   # break unless gets.chomp.downcase.start_with?('y') #exit the outer most loop to re - initialize_scores
# else
#   puts "Play again?" # insert existing play again code
# end

# def prompt(msg)
#   puts "=> #{msg}"
# end

# def initialize_scores(hsh)
#   hsh['Computer'] = 0
#   hsh['Player'] = 0
# end

# def display_scores(hsh)
#   prompt "The score is: Computer: #{hsh['Computer']}
#                 Player: #{hsh['Player']}"
# end

# def initialize_board
#   new_board = {}
#   (1..9).each { |num| new_board[num] = INITIAL_MARKER }
#   new_board
# end

# INITIAL_MARKER = ' '

# loop do 
# scores = {}
# initialize_scores(scores)
# display_scores(scores)
# board = initialize_board
# puts board

# break

# end

# puts 1 + 1


=begin
Program computer defense of marking an 'o' when Player has 2 'x's in a row

After player moves, check if there are 2 x's in a row
  Evaluate this by looping through the winning array data points and selecting ommitting only the third element
If expression evalutes to true, then iterate through winning array dayta point of third element and see if it's empty and not yet taken
If this is true, then place an 'o' on that point and prompt, 'blocked your win!'

=end


WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[3, 5, 7], [1, 5, 9]]              # diagonals



def computer_choice!(brd)
  if detect_threat?(brd)
    prompt "Computer blocks your win!!"




  else 
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end


def detect_threat?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 
      # && brd.values_at(line[0..2]).include(INITIAL_MARKER)
      true
    else
      break
    end
  end
end


























