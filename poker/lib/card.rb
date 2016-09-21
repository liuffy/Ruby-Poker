class Card

  attr_reader :value, :suit
  SUITS = [:♠, :♥, :♦, :♣]
  VALUES = [:A, :K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def initialize(value, suit)
    verify_card(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value} #{@suit}"
  end

  private

  def verify_card(value, suit)
    raise "Invalid card value!" unless VALUES.include?(value)
    raise "Invalid card suit!" unless SUITS.include?(suit)
  end

end
