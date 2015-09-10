class ShipBoard
  attr_reader :cells
  def initialize
    @cells = Array.new(10) {Array.new(10)}
  end

  def place_ship(ship, x, y, direction)

    boat_extension = []

    ship[:size].times do
      fail 'ship out of bounds' unless in_bounds?(x,y)
      boat_extension << [x, y]
      step ={ N: ->(x,y){[x, y-=1]},
              S: ->(x,y){[x, y+=1]},
              E: ->(x,y){[x+=1, y]},
              W: ->(x,y){[x-=1, y]} }
      new_cell = step[direction].call(x,y)
      x,y = new_cell[0],new_cell[1]
    end

    fail 'ship overlap' unless no_overlap?(boat_extension)

    boat_extension.each{|a| place_cell(ship[:name], a[0], a[1])}

  end

  def bomb_cell(x,y)
    return :miss if cell_content(x,y)==nil
    old_ships = list_of_ships.dup
    place_cell(nil, x, y)
    return :win if list_of_ships==[]
    old_ships==list_of_ships ? :hit : :sunk
  end



  def print_board
    for i in 0..9
      puts cells.transpose[i].inspect
    end
  end

  def list_of_ships
    @cells.flatten.compact.uniq
  end




private

  def in_bounds?(x,y)
    (0..9).cover?(x) && (0..9).cover?(y)
  end

  def no_overlap?(boat_extension)
    boat_extension.map { |a| cell_content(a[0],a[1]) }.compact.empty?
  end

  def cell_content(x, y)
    return @cells[x][y]
  end

  def place_cell(ship, x, y)
    @cells[x][y] = ship
  end

end
