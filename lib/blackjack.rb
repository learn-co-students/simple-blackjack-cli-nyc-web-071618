def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  game_start = deal_card + deal_card
  display_card_total(game_start)
  return game_start
end

def hit?(card_total)
  prompt_user
  answer = get_user_input
  until answer == "h" || answer == "s"
    invalid_command
    prompt_user
    answer
  end
  if answer == "h"
    card_total += deal_card
  elsif answer == "s"
    card_total
  end
end

def invalid_command
  puts "What are you trying to do?"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
end_game(card_total)
end
