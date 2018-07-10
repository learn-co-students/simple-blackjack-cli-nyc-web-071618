def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  card = 1 + rand(11)
  return card
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
  init_round = deal_card + deal_card
  display_card_total(init_round)
  return init_round
end

def hit?(card_total)
  prompt_user
  hit_or_stay = get_user_input
  until hit_or_stay == "h" || hit_or_stay == "s"
    invalid_command
    prompt_user
    hit_or_stay = get_user_input
  end
  if hit_or_stay == "h"
    card_total += deal_card
  elsif hit_or_stay == "s"
    card_total
  end
end

def invalid_command
  puts "Please enter a valid command"
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
