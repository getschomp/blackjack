

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
