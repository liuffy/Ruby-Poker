require 'rspec'
require 'card'

describe Card do

  let (:card) { Card.new(:A,:♠)}
  describe "#initialize" do
    it "sets a value" do
      expect(card.value).to eq(:A)
    end

    it "sets a suit" do
      expect(card.suit).to eq(:♠)
    end

    it "should raise an error if invalid card value is given" do
      expect {Card.new(:x, :♠)}.to raise_error("Invalid card value!")
    end

    it "should raise an error if invalid suit is given" do
      expect {Card.new(:A, :X)}.to raise_error("Invalid card suit!")
    end


  end

  describe "#to_s" do
    it "should return the correct description" do
      expect(card.to_s).to eq("A ♠")
    end
  end
end
