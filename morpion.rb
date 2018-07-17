class Board
  attr_accessor :cells 

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]

  end 

  def draw_board
    puts "\nBoard:"
    puts "\n #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n"
  end

  def draw_legend
    puts "Legend: "
    puts "1|2|3"
    puts "4|5|6"
    puts "7|8|9"
    puts "\n"
  end 

end

board = Board.new

puts board.draw_board
puts board.draw_legend