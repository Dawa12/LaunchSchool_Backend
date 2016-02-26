
def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k,v| line.include?(k) && v == initial_marker}.keys.first # purpose of .include?(k) don't all
  else
    nil
  end
end




initial_marker = {}
  (1..9).each { |num| initial_marker[num] = "#{num}" }


new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }





# iterate over range and assign each integer to key as symbol and each integer as value in string form 


# need to first add numbers into the hash before applying #each onto it 

(1..9).each {|key, value| initial_marker[key] = }









# review program, rename variable names if they look weird 
