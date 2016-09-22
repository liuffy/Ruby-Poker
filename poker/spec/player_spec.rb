require 'rspec'
require 'player'

describe Player do
  let(:player) { Player.new("Brian", 1000)}

  describe "#initialize" do
    it "should have a pot" do
      expect(player.pot).to eq(1000)
    end

    it "should have a hand" do
      expect(player.hand.is_a?(Hand)).to eq(true)
    end

    it "should have a name" do
      expect(player.name).to be_truthy
    end
  end

  describe "#get_action" do
    it "should should return valid actions only" do
      action = player.get_action
      expect("fsr".include?(action)).to eq(true)
    end
  end

  describe "#raise" do
    it "should raise error when player attempts to raise more than pot" do
      expect{ player.raise(1001) }.to raise_error("You don't have enough chips")
    end

    it "should update player's pot after raise" do
      player.raise(500)
      expect(player.pot).to eq(500)
    end
  end

  describe "card_to_discard" do

    # it "should discard a card" do
    #   player.hand.draw_card(Card.new(:A, :♥))
    #   player.hand.draw_card(Card.new(:K, :♥))
    #   player.hand.draw_card(Card.new(:Q, :♥))
    #   player.hand.draw_card(Card.new(:J, :♥))
    #   player.hand.draw_card(Card.new(10, :♥))
    #   card_to_discard = player.hand[3]
    #   player.card_to_discard(3)
    #
    #   expect(player.hand.has_card(card_to_discard)).to eq(false)
    # end
    #
    # it "should allow the player to not discard any cards"


  end


end
