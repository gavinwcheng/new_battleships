require 'bombboard'

describe BombBoard do

  it {is_expected.to respond_to(:bomb).with(2).arguments}
  it {is_expected.to respond_to(:bombed?).with(2).arguments}

  it 'starts with cell(0,0) unbombed' do
    expect(subject.bombed?(0,0)).to be false
  end

  it 'register a bomb at cell(0,0)' do
    subject.bomb(0,0)
    expect(subject.bombed?(0,0)).to be true
  end

end
