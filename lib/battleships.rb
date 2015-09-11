require_relative 'player'
require_relative 'shipboard'

def battleships

  puts
  puts "WELCOME TO BATTLESHIPS"
  puts

  puts "Player 1: what is your name?"
  player1name = gets.chomp
  puts "Hello #{player1name}"
  puts

  puts "Player 2: what is your name?"
  player2name = gets.chomp
  puts "Hello #{player2name}"
  puts

  board1 = ShipBoard.new
  player1 = Player.new(board1)
  board2 = ShipBoard.new
  player2 = Player.new(board2)

  ship1 = {name: :AA, size: 1}
  ship2 = {name: :BB, size: 2}
  ship3 = {name: :CC, size: 3}
  ship4 = {name: :DD, size: 4}

  ships_to_place1 = [ship1, ship2, ship3, ship4]
  ships_to_place2 = ships_to_place1.dup

  puts "#{player2name}, look away now!"
  puts

  while !ships_to_place1.empty? do
    puts "#{player1name}, you have #{ships_to_place1.length} ship(s) to place"
    get_place_data(ships_to_place1.last, board1)
    ships_to_place1.pop
  end

  puts "#{player1name}, look away now!"
  puts

  while !ships_to_place2.empty? do
    puts "#{player2name}, you have #{ships_to_place2.length} ship(s) to place"
    get_place_data(ships_to_place2.last, board2)
    ships_to_place2.pop
  end

end

def get_place_data(ship,board)
  puts "Please place a ship of size #{ship[:size]}."
  print "x coordinate? "
  x = gets.chomp.to_i
  print "y coordinate? "
  y = gets.chomp.to_i
  print "direction (N/S/E/W)? "
  direction = gets.chomp.to_sym
  puts
  board.place_ship(ship, x, y, direction)
  puts
  board.print_board
  puts
rescue
  puts $!
  puts
  get_place_data(ship,board)
end
