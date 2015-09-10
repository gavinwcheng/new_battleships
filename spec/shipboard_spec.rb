require 'shipboard'

describe ShipBoard do

  context 'when placing a ship' do

    it 'places ship from size, start co-ord and direction' do
      ship = {name: :ship_1, size: 5}
      x = 0
      y = 0
      direction = :E
      subject.place_ship(ship, x, y, direction)
      expect(subject.list_of_ships).to include(ship[:name])
    end

    it 'raises error if the ship lies out of bounds' do
      ship = {name: :ship_1, size: 5}
      x = 8
      y = 8
      direction = :E
      expect{subject.place_ship(ship, x, y, direction)}.to raise_error('ship out of bounds')
    end

    it 'raises error if ship overlaps another' do
      ship1 = {name: :ship_1, size: 5}
      ship2 = {name: :ship_2, size: 3}
      subject.place_ship(ship1, 0, 0, :E)
      expect{subject.place_ship(ship2, 3, 2, :N)}.to raise_error('ship overlap')
    end

  end

end
