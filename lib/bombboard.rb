class BombBoard
  def initialize
    @cells = Array.new(10) {Array.new(10)}
  end

  def bomb(x,y)
    @cells[x][y] = true
  end

  def bombed?(x,y)
    @cells[x][y] == true #This stops the method returning nil.
  end

end
