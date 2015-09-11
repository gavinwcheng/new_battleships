require "player"

describe Player do

  subject { Player.new(ShipBoard.new) }

  describe ".fire" do

    it "responds to fire with 3 arguments" do
      expect(subject).to respond_to(:fire).with(3).argument
    end

    it "calls take_fire on opponent when I fire" do
      opponent = double :opponent, take_fire: nil
      expect(opponent).to receive(:take_fire).with(0,0)
      subject.fire(opponent, 0, 0)
    end

    it "increases history list by 1" do
      opponent = double :opponent, take_fire: nil
      expect { subject.fire(opponent, 0, 0) }.to change { subject.history.length }.by(1)
    end

  end

  describe ".take_fire" do

    it "responds to take_fire with 2 arguments" do
      expect(subject).to respond_to(:take_fire).with(2).argument
    end

    it "returns :hit or :miss or :sunk or :win when I take fire" do
      hash = {hit: true, miss: true, sunk: true, win: true}
      expect(hash[subject.take_fire(0,0)]).to be true
    end

  end

end
