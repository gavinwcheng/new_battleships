require 'game'

describe Game do

  # before :all do
  #   subject = Game.new(:shipboard1, :shipboard2)
  # end

  # it { is_expected.to respond_to(:initialize).with(2).arguments }

  it { is_expected.to respond_to(:play) }

  xit 'returns a winner when played' do
    winner = subject.play
    expect(winner == :player1 || winner == :player2).to be_truthy
  end

end
