class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = []
    @cards << cards
  end

  def hand_total
    i = 0
    card_values = []
    while i < @cards.length
      value = @cards[i].value
      if value == "J" || value == "Q" || value == "K"
        value = 10
      elsif value == "A"
      value = 1
      else
        value = value.to_i
      end
      card_values << value
      i = i + 1
    end
    hand_total = card_values.inject{|sum, x| sum + x}
    if card_values.include?(1) && hand_total < 12
     hand_total += 10
    end
  hand_total
  end
end
