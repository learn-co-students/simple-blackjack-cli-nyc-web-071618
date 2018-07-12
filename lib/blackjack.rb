def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  return rand(1..11)
end

def get_card_total(cards)
  total = 0
  cards.each do |card|
    total += card
  end
end

def display_cards_and_total(cards)
  # code #display_cards here
  card_total = get_card_total(cards)
  puts "Cards: #{cards}, Total: #{card_total}"
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  gets.chomp
end

def end_game(cards)
  # code #end_game here
  card_total = get_card_total(cards)
  puts "Sorry, you busted with #{card_total}. Thanks for playing!"
end

def initial_round
  # code #initial_round here
  card1 = deal_card
  card2 = deal_card
  return [card1, card2]
end

def hit?(card_total)
  # code hit? here
  prompt_user
  input = get_user_input
  
  if(input == "s")
    return card_total
  end
  
  if(input == "h")
    new_card = deal_card
    card_total += new_card
  else
    invalid_command
    hit?(card_total)
  end
end

def invalid_command
  # code invalid_command here
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  # code runner here
  welcome
  cards = initial_round
  while card_total <= 21
    display_cards(card_total)
    card_total = hit?(card_total)
  end
  end_game(card_total)
end
  
card1, card2 = initial_round

puts card1
puts card2
