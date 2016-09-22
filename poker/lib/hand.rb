require_relative 'card'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def [](idx)
    @card[idx]
  end

  def []=(idx, value)
    @card[idx] = value
  end

  def has_card(card)
    @cards.include?(card)
  end

  def draw_card(card)
    raise "Your hand is already full!" if @cards.size == 5
    @cards << card
  end

  def discard_card(card_index)
    raise "You cannot discard additional cards!" if @cards.size <= 2
    @cards.delete_at(card_index)
  end

  def value
    calculate_hand
  end

  def compare(hand)
  end

  private
  def calculate_hand
  end
end
