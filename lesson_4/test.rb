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
  elsif total(player) < total(dealer)
    'Dealer'
  else
    "It's a tie!"
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





# program
loop do   
  prompt "Welcome to 21"  
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

  #inlcude a break if player bust or it's ok since it will skip to end since it won't meet if conditions below

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

  if !busted?(dealer_cards) # if dealer didn't bust, aka chose to stay
    # compare scores logic (only if dealer 'stays' and neither dealer nor player bust)
    prompt "Game over. Final scores: "
    prompt "Player: #{total(player_cards)}"
    prompt "Dealer: #{total(dealer_cards)}"
    prompt "Winner is...#{winner?(player_cards, dealer_cards)}"
  end

  prompt "Play again? (y/n)"
  break if gets.chomp.start_with?('n')
end
prompt "Thanks for playing!"


# search for improper closures partenthesis or brackets or quotes or loop end / if end pair 


