=begin

1) General Game Description 
  Twenty-one is a card game in which two players take turns in picking cards from a deck, to form their hand of cards. If the sum of the values of the cards in their hands is greater than 21, they lose. However, if upon comparing hands, one hand is less than 21 but greater than the other hand, that player wins. 

2) List nouns and verbs
Nouns:
- Player
- Deck of cards
- Player Hand of cards
- Points

Verbs
- "Hit" a card
- Compare cards



3) Organize nouns with corresponding verbs

- Player
  - "Hit" a card
  - Compare cards
- Deck of cards
- Player Hand of cards
- Points


1) 
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.

2)

Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts

3)

Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here, or in Deck?)
Participant
Deck
- deal (should this be here, or in Dealer?)
Card
Game
- start


There's a lot of redundancy between Player and Dealer - perhaps they should be subclasses of Participant
  - chose instead to include module called Hand to capture redundancy



=end

# 4) Spike

class Player
  def hit
  end
  def stay
  end
  def busted?
  end
  def total
  end

end

class Dealer
  def hit
  end
  def stay
  end
  def busted?
  end
  def total
  end
  def deal
    # does this belong with this class or Dealer class?
  end

end

class Participant
  # how to use this class? Is this necesssary?
end

class Deck
  # create deal method here?
end

class Card
end

class Game
  def initialize
  end

  def start
    display_welcome_message
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
    display_goodbye_message
  end
end

Game.new.start















