require 'pry'

# varibles

VALUES = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'A', 'K', 'Q', 'J' ]
SYMBOLS = [ 'H', 'D', 'S', 'C' ]

# methods 

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SYMBOLS.product(VALUES).shuffle
end

def busted?(cards)
  total(cards) > 21
end

def display_busted?(cards)
  if busted?(cards)
    prompt "You've busted!"
    prompt "Your new hand is #{cards}."
    prompt "You went over 21 with points of #{total(cards)}"
  end
  busted?(cards)
end

def winner?(player, dealer)
  if total(player) > total(dealer)
    'Player'
  else
    'Dealer'
end



def total(cards) # calculate total points of your cards 
points = 0

  cards.each do |element|
    if element.last.to_i > 0
      points += element.last.to_i
    elsif element.last == 'A'
      points += 11
    elsif element.last.to_i == 0 # 'J' || 'Q' || 'K'
      points += 10
    end
  end

  # puts "points before subtraction: #{points}"
  # dynamic point calculation for 'A'
  cards.flatten.select { |value| value == 'A'}.count.times do
    if points > 21
      points -= 10
    end
  end

  # binding.pry
  points
end

# a = [["D", "1"], ["H", "A"], ["H", "1"], ["H", "3"], ["H", "A"], ["H", "A"]]
# total(a)


=begin
dynamic A value 
after points are summed, points are over 21
then check if A exists, if so, subtract 10

put a cap on how many times u can subtract 10 by doing times and passing that to an integer. 
=end




# program
loop do
  prompt "Welcome to 21"  

  loop do   
    game_deck = initialize_deck
    player_cards = []
    dealer_cards = []
   
    2.times do
    player_cards << game_deck.pop
    dealer_cards << game_deck.pop
    end

    prompt "Starting a new game..."
    prompt "Your cards are #{player_cards}"
    prompt "Dealer's cards are #{dealer_cards.first} and ? "
    prompt "Your points are #{total(player_cards)}"

    # player turn 
    player_turn = nil 
    loop do
      puts "Would you like to hit or stay?"
      player_turn = gets.chomp
      prompt "You chose #{player_turn}"
      player_cards << game_deck.pop
      
      break if player_turn == 'stay' || display_busted?(player_cards)
      prompt "Now your cards are #{player_cards}"
      prompt "Now your points are #{total(player_cards)}"
    end

=begin
    # dealer's turn (only if player didn't bust)
    if player_turn == 'stay'
      prompt "Dealer's turn ..."
      prompt "Dealer's cards are #{dealer_cards}"
      prompt "Dealer's points are #{total(dealer_cards)}" 
    
      loop do  
        if total(dealer_cards) < total(player_cards)
          dealer_cards << game_deck.pop
          prompt "Dealer choses to hit!"
          break if display_busted?(dealer_cards)
          prompt "Now dealer's cards are #{dealer_cards}"
          prompt "Now dealer's points are #{total(dealer_cards)}"
        else  
          prompt "Dealer choses to stay"
          break
        end
      end
    end

    break if busted?(dealer_cards)
=end

    # compare scores logic (only if dealer 'stays' and neither dealer nor player bust)
    prompt "Game over. Final scores: "
    prompt "Player: #{total(player_cards)}"
    prompt "Dealer: #{total(dealer_cards)}"
    prompt "Winner is #{winner?(player_cards, dealer_cards)}"

    break
  end

  prompt "Play again? (y/n)"
  break if gets.chomp.start_with?('n')
end
prompt "Thanks for playing!"
end


=begin

Dealer turn - 
  must stay if points are above player (and below 21) implied by busted?
  Must bust when over 21 instead of continuously hitting
  Busted 1 round late
  loops into a new game with player starting - must break and compare scores 


refactoring 
 - unnecessary break after comparing score prompt, can I elimiate one outer loop? 
 - comparing scores - turn into own method? 


New game 
  welcome / greetings 
    your cards are = variable 
    dealer cards are = variable 
  Would you like to hit or stay?
    if hit - destructively get card from deck (use pop method)
  Dealer turn - 
    dealer will hit until total above 17 else stays
  Compare cards
    Detect winner
    prompt statemnet with scores 
  Playagain? 
    Break if no
=end



