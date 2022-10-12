require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        return @current_player = @player_2 if @current_player == @player_1
        return @current_player = @player_1 if @current_player == @player_2
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                return "Victory for Player #{@current_player.mark}"
            else
                self.switch_turn
            end
        end
        p "draw"
    end

end
            

