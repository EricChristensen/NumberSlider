require './board'

board = Board.new("12365478.")
puts "here is the board:"
puts board.to_string()

until board.win? do
  puts "enter a valid move"
  move = gets
  if board.valid_move?(move)
    board.move(move)
    puts board.to_string
  else
    puts "that was not a valid move you jerk"
  end
end
puts "You won!!!"
