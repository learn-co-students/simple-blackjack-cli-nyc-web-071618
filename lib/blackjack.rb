require "pry"

def welcome
  puts "Welcome to the Blackjack Table"# code #welcome here
  return "Welcome to the Blackjack Table"
end

def deal_card
  return rand(10)+1# code #deal_card here
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"# code #display_card_total here
  return card_total
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"# code #prompt_user here
end

def get_user_input
  gets.chomp# code #get_user_input here
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"# code #end_game here
end

def initial_round
  card_total = 0
  2.times do
    card_total += deal_card# code #initial_round here
  end
  display_card_total(card_total)
  return card_total
end

def hit?(card_total)
  prompt_user
  answer = get_user_input
  if answer == "h"
    # binding.pry
    card_total += deal_card
    # display_card_total(card_total)
    # puts "Your hand equals #{card_total}"
  elsif answer == "s"
    # display_card_total(card_total)
    # puts "Your hand equals #{card_total}"
  else
    invalid_command
  end
  return card_total
end

# hit?(rand(11))

def invalid_command
  puts "Please enter a valid command"
  prompt_user
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  # hit?(initial_round)
  until card_total > 21 do
    # binding.pry
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end

# runner
