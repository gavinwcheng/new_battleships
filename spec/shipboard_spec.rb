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

  context 'when attacking' do

      before :each  do

      end

      it 'can report miss' do
        ship1={name: :ship_1, size: 1}
        ship2={name: :ship_2, size: 2}
        subject.place_ship(ship1, 0, 0, :E)
        subject.place_ship(ship2, 1, 1, :E)
        expect(subject.bomb_cell(1,0)).to eq(:miss)
      end

      it 'can report hit' do
        ship1={name: :ship_1, size: 1}
        ship2={name: :ship_2, size: 2}
        subject.place_ship(ship1, 0, 0, :E)
        subject.place_ship(ship2, 1, 1, :E)
        expect(subject.bomb_cell(1,1)).to eq(:hit)
      end

      it 'can report sink' do
        ship1={name: :ship_1, size: 1}
        ship2={name: :ship_2, size: 2}
        subject.place_ship(ship1, 0, 0, :E)
        subject.place_ship(ship2, 1, 1, :E)
        subject.bomb_cell(1,1)
        expect(subject.bomb_cell(2,1)).to eq(:sunk)
      end

      it 'can report win' do
        ship1={name: :ship_1, size: 1}
        ship2={name: :ship_2, size: 2}
        subject.place_ship(ship1, 0, 0, :E)
        subject.place_ship(ship2, 1, 1, :E)
        subject.bomb_cell(2,1)
        subject.bomb_cell(1,1)
        expect(subject.bomb_cell(0,0)).to eq(:win)
      end

  end


end
