def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  card = rand(1..10)
  
  if card == 1
    return "A"
  elsif card == 10
    case (rand(100)%3)
      when 0
        return "J"
      when 1
        return "Q"
      when 2
        return "K"
      else
        return "J"
    end
  else
    return card
  end
end

def get_card_total(cards)
  total = 0
  has_A = false;
  
  cards.each do |card|
    case card
      when "A"
        total += 1
        has_A = true
      when "K"
        total += 10
      when "Q"
        total += 10
      when "J"
        total += 10
      else
        total += card
    end
  end
  
  if(has_A == true && total + 10 <= 21)
    total += 10
  end
  return total
end

def display_cards_and_total(cards)
  # code #display_cards here
  card_total = get_card_total(cards)
  puts "Cards: #{cards}"
  puts "Total: #{card_total}"
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

def hit?(cards)
  # code hit? here
  prompt_user
  input = get_user_input
  
  if(input == "s")
    return cards
  end
  
  if(input == "h")
    new_card = deal_card
    cards.push(new_card)
  else
    invalid_command
    hit?(cards)
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
  
  loop do
    card_total = get_card_total(cards)
    display_cards_and_total(cards)
    break if card_total > 21
    cards = hit?(cards)
  end
  
  end_game(cards)
end
