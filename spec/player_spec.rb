require "player"

describe Player do

  subject { Player.new(ShipBoard.new) }

  it "responds to fire with 3 arguments" do
    expect(subject).to respond_to(:fire).with(3).argument
  end

  it "responds to take_fire with 2 arguments" do
    expect(subject).to respond_to(:take_fire).with(2).argument
  end

  it "calls bomb_cell on my board when I take fire" do
    expect(subject.board).to receive(:bomb_cell).with(0,0)
    subject.take_fire(0,0)
  end
end
