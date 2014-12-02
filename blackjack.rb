#!/usr/bin/env ruby

# YOUR CODE HERE
require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'

@deck = Deck.new
@player_hand = Hand.new(@deck.deal_card)
@player_hand.cards << @deck.deal_card
@dealer_hand = Hand.new(@deck.deal_card)
@dealer_hand.cards << @deck.deal_card

puts "Player was dealt #{@player_hand.cards[0].value} #{@player_hand.cards[0].suit}"
puts "Player was dealt #{@player_hand.cards[1].value} #{@player_hand.cards[1].suit}"
puts "Player score #{@player_hand.hand_total}"
puts "Dealer was dealt #{@dealer_hand.cards[0].value} #{@dealer_hand.cards[0].suit}"
puts "Dealer was dealt #{@dealer_hand.cards[1].value} #{@dealer_hand.cards[1].suit}"
puts "Dealer score #{@dealer_hand.hand_total}"

puts "Hit or stand (H/S)?"
input = gets.chomp.upcase
while 5>2
  if input == "H"
    new_card = @deck.deal_card
    @player_hand.cards << new_card
    puts "Player was dealt #{new_card.value} #{new_card.suit}"
    puts "Player score #{@player_hand.hand_total}"
    if @player_hand.hand_total > 21
      break
    end
    puts "Hit or stand (H/S)?"
    input = gets.chomp.upcase
  elsif input == "S"
    break
  else
    puts "Please choose either H or S"
    input = gets.chomp.upcase
    break
  end
end

if @player_hand.hand_total > 21
  puts "Bust...you lose"
else
  until @dealer_hand.hand_total >= 17
    new_card = @deck.deal_card
    @dealer_hand.cards << new_card
    puts "Dealer was dealt #{new_card.value} #{new_card.suit}"
    puts "Dealer score #{@dealer_hand.hand_total}"
  end

  if @dealer_hand.hand_total <= 21
    puts "Dealer stands"
  end

  if @dealer_hand.hand_total > 21
    puts "Dealer busts"
    puts "Player wins"
  end

  if @dealer_hand.hand_total > @player_hand.hand_total && @dealer_hand.hand_total <= 21
    puts "Dealer wins"
  elsif @player_hand.hand_total > @dealer_hand.hand_total && @player_hand.hand_total <= 21
    puts "Player wins"
  elsif @dealer_hand.hand_total == @player_hand.hand_total
    puts "Tie game"
  end
end
