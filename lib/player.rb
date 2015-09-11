class Player

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def fire(opponent,x,y)
  end

  def take_fire(x,y)
    @board.bomb_cell(x,y)
  end
end
