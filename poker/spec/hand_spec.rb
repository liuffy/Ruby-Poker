require 'rspec'
require 'hand'

describe Hand do
  let(:hand) { Hand.new }

  describe "#initialize" do

    it "should contain no cards" do
      expect(hand.cards).to be_empty
    end

  end

  describe "#draw_card" do
    let(:drawn_card) {Card.new(8, :♥)}

    it "should add new card to the cards" do
      hand.draw_card(drawn_card)
      expect(hand.cards).to include(drawn_card)
    end

    it "should raise error if hand is full" do
      hand.draw_card(Card.new(:A, :♥))
      hand.draw_card(Card.new(:K, :♥))
      hand.draw_card(Card.new(:Q, :♥))
      hand.draw_card(Card.new(:J, :♥))
      hand.draw_card(Card.new(10, :♥))

      expect{ hand.draw_card(drawn_card) }.to raise_error("Your hand is already full!")
    end
  end

  describe "#discard_card" do
    before(:each) do
      hand.draw_card(Card.new(:A, :♥))
      hand.draw_card(Card.new(:K, :♥))
      hand.draw_card(Card.new(:Q, :♥))
      hand.draw_card(Card.new(:J, :♥))
      hand.draw_card(Card.new(10, :♥))
    end

    it "should remove card from the hand" do
      card_to_discard = hand.cards[4]
      hand.discard_card(4)
      expect(hand.cards).not_to include(card_to_discard)
    end

    it "should raise error when hand has 2 or fewer cards" do
      hand.discard_card(4)
      hand.discard_card(3)
      hand.discard_card(2)

      expect{hand.discard_card(1)}.to raise_error("You cannot discard additional cards!")
    end
  end

  describe "#value" do
    it "should calculate the value of a hand"
  end

end
