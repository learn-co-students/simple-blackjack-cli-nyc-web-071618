def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
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
  card_total = get_card_total(cards)
  puts "Cards: #{cards}"
  puts "Total: #{card_total}"
end

def get_user_input
  puts "Type 'h' to hit or 's' to stay"
  gets.chomp
end

def end_game(cards)
  # code #end_game here
  card_total = get_card_total(cards)
  puts "Sorry, you busted with #{card_total}. Thanks for playing!"
end

def initial_round
  # code #initial_round here
  player_card_1 = deal_card
  player_card_2 = deal_card
  
  dealer_card_1 = deal_card
  dealer_card_2 = deal_card
  return [player_card_1, player_card_2], [dealer_card_1, dealer_card_2]
end

def hit?(cards, is_dealer=false)
  
  # dealer - Crude AI
  if(is_dealer == true)
    cards_total = get_card_total(cards)
    randnum = rand(100)%2
    if(card_total == 21 || randnum == 0)
      return cards
    elsif(randnum == 1)
      new_card = deal_card
      cards.push(new_card)
    end
    return cards
  end
  
  # player
  input = get_user_input

  if(input == "s")
    return cards
  end
  
  if(input == "h")
    new_card = deal_card
    cards.push(new_card)
    return cards
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
  player_cards, dealer_cards = initial_round
  display_cards_and_total(player_cards)
  player_card_total = get_card_total(player_cards)
   dealer_cards_total = get_card_total(dealer_cards)
  player_stay = false
  dealer_stay = false
  player_busted = false
  dealer_busted = false
  
  while !player_stay|| !dealer_stay
    player_cards_temp = hit?(player_cards)
    
    if(!dealer_busted)
      dealer_cards_temp = hit?(dealer_cards, true)
    end
    
    player_cards_temp == player_cards ? player_stay = true : player_stay = false
    dealer_cards_temp == dealer_cards ? dealer_stay = true : dealer_stay = false
    
    player_cards = player_cards_temp
    dealer_cards = dealer_cards_temp
    display_cards_and_total(player_cards)
    display_cards_and_total(dealer_cards)
    
    player_card_total = get_card_total(player_cards)
    
    if player_card_total > 21
      player_busted = true
      break
    end
    
    dealer_cards_total = get_card_total(dealer_cards)
    
    if dealer_cards_total > 21 
      dealer_busted = true
    end
  end
  
  if(player_busted)
    end_game(player_cards)
  elsif(dealer_busted)
    puts "You Win!"
    
  end
end
