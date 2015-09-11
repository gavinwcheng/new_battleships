class Player

  attr_reader :board, :history

  def initialize(board)
    @board = board
    @history = []
  end

  def fire(opponent,x,y)
    @history << [x,y, opponent.take_fire(x,y)]
    return history.last[2]
  end

  def take_fire(x,y)
    @board.bomb_cell(x,y)
  end
end
