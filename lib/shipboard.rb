class ShipBoard

  def initialize
    @cells = Array.new(10) {Array.new(10)}
  end

  def place_ship(ship, x, y)
    @cells[x][y] = ship
  end

  def cell_content(x, y)
    return @cells[x][y]
  end

  def list_of_ships
    @cells.flatten.compact.uniq
  end

end
