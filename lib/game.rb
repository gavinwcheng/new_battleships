class Game

  def initialize(shipboard1 = nil, shipboard2 = nil)
    @shipboard1 = shipboard1
    @shipboard2 = shipboard2
  end

  def play
    while true do

      print "Player 1: enter bomb's x coordinate: "
      x = gets.chomp.to_i
      print "Player 1: enter bomb's y coordinate: "
      y = gets.chomp.to_i

      @shipboard2.place_ship(nil, x, y)

      return :player1 if @shipboard2.list_of_ships.empty?

      print "Player 2: enter bomb's x coordinate: "
      x = gets.chomp.to_i
      print "Player 2: enter bomb's y coordinate: "
      y = gets.chomp.to_i

      @shipboard1.place_ship(nil, x, y)

      return :player2 if @shipboard1.list_of_ships.empty?

    end
  end

end
