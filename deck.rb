require 'pry'
require_relative 'card'

class Deck
  attr_accessor :num_of_cards
  attr_reader :cards
  #numofcards
  #an array of cards
  def initialize
    @num_of_cards = 52
    @cards = build_deck
    binding.pry
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
  # def remove_card

  def deal_card
    @selected_card = @cards.sample

  end
end

@deck = Deck.new
puts @selected_card
binding.pry
