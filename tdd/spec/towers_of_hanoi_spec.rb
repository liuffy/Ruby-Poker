require 'rspec'
require 'towersofhanoi'

describe TowersOfHanoi do
  let(:game) { TowersOfHanoi.new}

  describe "#initialize" do
    it "initialize the towers" do
      expect(game.towers).to eq([3,2,1],[],[])
    end
  end

  describe "#move" do # ([3,2],[1],[])
    before(:each) do
      game.move(0,1)
    end

    it "should remove disc from from_tower" do
      expect(game.towers[0]).to eq([3,2])
    end

    it "should stack disc on to_tower" do
      expect(game.towers[1]).to eq([1])
    end

    it "should raise error when attempt to move disk from empty tower" do
      expect{game.move(2,0)}.to raise_error("No disk to move!")
    end

    it "should raise error when attempting to place larger disk on smaller disk" do
      expect{game.move(0,1)}.to raise_error("Can't place disk on smaller disk!")
    end
  end

  describe "#won?" do
    it "should not return true when the game is not over" do
      game.towers = [[1],[2],[3]]
      expect(game.won?).to eq(false)
    end

    it "should return true when the third tower is stacked" do
      game.towers = [[],[],[3,2,1]]
      expect(game.won?).to eq(true)
    end

    it "should return true when the second tower is stacked" do
      game.towers = [[],[3,2,1],[]]
      expect(game.won?).to eq(true)
    end
end
