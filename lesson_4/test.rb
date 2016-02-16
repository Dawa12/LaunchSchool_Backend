require 'pry'

=begin

Game description: 
Tic tac toe is a 2 player game composed of 3x3 squares
Player choose 'x' or 'o' and wins if he gets three of his pieces in a row; whehter horizontally, vertically, diagonally
If all 9 squares are marked without a player / computer win, then it's a tie

Game play: 
1) Display the initial 3x3 board
2) Prompt player to mark a spot on the board 
3) Computer moves 
4) Display updated board
5) If winner, display winner
6) If board is full, display a tie
7) If neither winner nor tie, loop back to step 2)
8) Prmopt play again?
9) If yes, loop back to step 1
10) Else, goodbye

=end


#TTT joiner method bonus feature

# def joinor(arr)
#   arr.each do |x|
#     puts x
# end

arr = [1, 2, 3]

def joinor(arr, element1)
  arr.map do |x|
    while x < arr.count
      if x == (arr.count-1)
        print "#{x}#{element1}"
        x += 1
      else
        print "#{x}, "

      end
    end
      print "or " + x.to_s
    break 
  end
end

joinor(arr, '; ')



 


=begin

First focus on getting: "1, 2, or 3"

Iterate over all elements of the passed array (use .each)
Count number of elements to the array. Use #count method
Insert an 'or' before the last element of the array.




=end

