=begin

deck of cards
52 cards

hash 
nested hash
array 
nested array


4 x (2..10)
4 x Jack, King, Queen, Ace



player cards 
dealer cards
deck

remove from one data set and add to another data set 

nested hashes - listing values and count

given a range (2..10, iterate over the range and add every value as a key to the hash. 
add the other quene, jack, king, ace as well
give all keys avlues of 4 


nested arrays with each of 13 values as their own array, repeated 4 times 
hash with key value pair? Counting the number of values will be more difficult, and will have to create own method 

=end


# deck = *(2..10)
# p deck
# deck += deck
# deck += deck
# p deck




def score_5_action(scores, play_again?, board)
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
    play_again?.gsub!(/\s/, user_answer) # destructive substitution of the space character with string value of user_answer
  end
  
  return play_again?
end



















