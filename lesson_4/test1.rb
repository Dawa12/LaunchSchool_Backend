=begin

AI offense 
using at_risk square method, make computer choice = to last spot if it already has the first two down. 





=end


x = 1
y = 2

if x == 1
  p 'hi'
elsif y == 2
  p 'bye'
else 
  nil
end



def find_at_risk_square(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2
    board.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first 
  elsif board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first # purpose of .include?(k) don't all
  else
    nil
  end
end

# method rename to at_risk_opportunity_square




