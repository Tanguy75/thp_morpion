class Game
	require_relative "player.rb"
    require_relative "board.rb"
    require_relative "boardcase.rb"

	attr_accessor :end_game

    def initialize
    	@player_1 = Player.new("Player 1", 'X')
    	@player_2 = Player.new("Player 2", 'O')
    	@current_player = @player_1
    	@end_game = false
        
        @board = Board.new
    end

    def switch_player
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
        # if the current player equal player 1 is true, then current player becomes player 2. If false, current player becomes player 1.
    end

    def player_input
        @board.draw_board
        @board.draw_legend
        puts "Your turn, #{@current_player.name}. Pick a cell by typing a number between 1 and 9."
        input = gets.chomp.to_i 
            until input.between?(1, 9)
            puts "You need to type a number between 1 and 9."
            input = gets.chomp.to_i 
            end
        input - 1
    end

    def player_move
        move = player_input
            until @board.cells[move].value == " "
            puts "This cell has already been taken."
            move = player_input
            end
        @board.cells[move].value = @current_player.symbol
        @current_player.taken_cells << move
    end

    

    def check_end_game
        conditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        conditions.each do |condition|
            if (condition - @current_player.taken_cells).empty?
                puts "#{@current_player.name} wins!"
                @end_game = true 
            end
        end

            if @player_1.taken_cells.size + @player_2.taken_cells.size >= 9
              puts "It's a draw."
            @end_game = true
            end
        @end_game
    end 

end

game = Game.new
puts "Tic Tac Toe"

until game.check_end_game
  game.player_move
  game.check_end_game
  game.switch_player
end 









