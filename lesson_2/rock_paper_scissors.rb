VALID_CHOICES = %w(rock paper scissors lizard spock)
choice_symbols = { r: 'rock', p: 'paper', sc: 'scissors', sp: 'spock', l: 'lizard' }

scores = { human: 0, computer: 0 }

def prompt(string)
  Kernel.puts("=> #{string}")
end

def win?(first, second)
  (first == 'rock' && second == ('scissors' || 'lizard')) ||
    (first == 'paper' && second == ('rock' || 'spock')) ||
    (first == 'scissors' && second == ('paper' || 'lizard')) ||
    (first == 'lizard' && second == ('paper' || 'spock')) ||
    (first == 'spock' && second == ('scissors' || 'rock'))
end

def reset_scores(scores)
  scores[:human] = 0
  scores[:computer] = 0
end

def display_round_result(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer wins the round!")
  else
    prompt("This round is a tie!")
  end
end

def tally_scores(choice, computer_choice, scores)
  if win?(choice, computer_choice)
    scores[:human] += 1
  elsif win?(computer_choice, choice)
    scores[:computer] += 1
  end
end

def display_scoreboards(scores)
  puts "-------------"
  puts "Scoreboard"
  puts "-------------"
  scores.each { |player, score| puts "#{player}: #{score}" }
end

def game_over?(scores)
  scores[:human] == 5 || scores[:computer] == 5
end

abbr = <<-MESSAGE
Write out the word, or use its respective aabbreviation!:
    r  -> rock
    p  -> paper
    sc -> scissors
    l  -> lizard
    sp -> spock
MESSAGE

choice = ''
loop do
  reset_scores(scores)
  prompt("Welcome to Rock Paper Scissors Lizard Spock! Time to choose your weapon!")

  loop do
    prompt(abbr)

    loop do
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      elsif choice_symbols.key?(choice.to_sym)
        choice = choice_symbols[choice.to_sym]
        break
      else
        prompt("That's not a valid choice, try again")
      end
    end

    computer_choice = VALID_CHOICES.sample()
    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_round_result(choice, computer_choice)
    tally_scores(choice, computer_choice, scores)
    display_scoreboards(scores)

    if game_over?(scores)
      if scores[:human] > scores[:computer]
        Kernel.puts("You win!") # receive private method error when using 'prompt' instead of 'puts'
      else
        Kernel.puts("Sorry, you lost!")
      end
      break
    end

    prompt("Still playing till five? Press <enter> or forfeit (f)")
    answer = Kernel.gets().chomp()
    break if answer.downcase().start_with?('f')
  end
  prompt("Would you like to play again? (y/n)")
  response = Kernel.gets().chomp()
  break unless response.downcase().start_with?('y')
end

prompt("Thank you for playing")
prompt("Goodbye!")
