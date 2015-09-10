require 'shipboard'

describe ShipBoard do

  it { is_expected.to respond_to(:place_cell).with(3).arguments }
  it { is_expected.to respond_to(:cell_content).with(2).arguments }
  it { is_expected.to respond_to(:list_of_ships) }

  it 'can place a ship in a cell' do
    subject.place_cell(:ship, 0, 0)
    expect(subject.cell_content(0, 0)).to eq :ship
  end

  it 'adds a placed ship to the list of ships' do
    subject.place_cell(:ship, 0, 0)
    expect(subject.list_of_ships).to include(:ship)
  end

  it 'places ship from size, start co-ord and direction' do
    ship = {name: :ship_1, size: 5}
    x = 0
    y = 0
    direction = :E

    subject.place_ship(ship, x, y, direction)
    expect(subject.list_of_ships).to include(ship[:name])

  end

end
