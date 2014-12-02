require 'pry'
require_relative 'card'
require_relative 'hand'

class Deck
  attr_accessor :num_of_cards
  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    @num_of_cards = 52
    @values=['A','2','3','4','5','6','7','8','9','10','J','Q','K']
    @suits=['♠', '♣', '♥', '♦']
    cards=[]
    @suits.each do |suit|
      @values.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards
  end

  def deal_card
    @selected_card = @cards.sample
    @cards.delete(@selected_card)
    @selected_card
  end
end

@deck = Deck.new
@player_hand = Hand.new(@deck.deal_card)
@player_hand.cards << @deck.deal_card
@dealer_hand = Hand.new(@deck.deal_card)
@dealer_hand.cards << @deck.deal_card

puts "Player was dealt #{@player_hand.cards[0].value} #{@player_hand.cards[0].suit}"
puts "Player was dealt #{@player_hand.cards[1].value} #{@player_hand.cards[1].suit}"
puts "Player score #{@player_hand.hand_total}"
puts "Dealer was dealt #{@dealer_hand.cards[0].value} #{@dealer_hand.cards[0].suit}"
puts "Dealer was dealt #{@dealer_hand.cards[1].value}#{@dealer_hand.cards[1].suit}"
puts "Dealer score #{@dealer_hand.hand_total}"

puts "Hit or stand (H/S)?"
input = gets.chomp.upcase
  until input == "S"
    if input == "H"
    new_card = @deck.deal_card
    puts "Player was dealt #{new_card.value} #{new_card.suit}"
    puts "Hit or stand (H/S)?"
    input = gets.chomp.upcase
    else
    puts "Please choose either H or S"
    input = gets.chomp.upcase
    end
#player_score
  end


binding.pry
