class ShipBoard

  def initialize
    @cells = Array.new(10) {Array.new(10)}
  end

  def place_ship(ship, x, y, direction)
    boat_extension = []
    ship[:size].times do
      fail 'ship out of bounds'  unless in_bounds?(x,y)
      boat_extension << [x, y]
      step ={ N: ->(x,y){[x, y-=1]},
              S: ->(x,y){[x, y+=1]},
              E: ->(x,y){[x+=1, y]},
              W: ->(x,y){[x-=1, y]} }
      new_cell=step[direction].call(x,y)
      x,y=new_cell[0],new_cell[1]
      end
      boat_extension.each{|a| place_cell(ship[:name], a[0], a[1])}
  end

  def in_bounds?(x,y)
      (0..9).cover?(x) && (0..9).cover?(y)
  end


  def cell_content(x, y)
    return @cells[x][y]
  end

  def list_of_ships
    @cells.flatten.compact.uniq
  end

  def place_cell(ship, x, y)
    @cells[x][y] = ship
  end
end
