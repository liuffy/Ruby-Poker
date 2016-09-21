require_relative 'card'

class Deck
  
  attr_reader :cards
  SUITS = [:♠, :♥, :♦, :♣]
  VALUES = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def initialize
    @cards = []
    initiate_deck
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw!
    @cards.pop
  end

  private
  def initiate_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end
end
