require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(n, *marks)
        @players = marks.map {|mark| HumanPlayer.new(mark)}
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first 
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "Victory for Player #{@current_player.mark}"
                return
            else
                self.switch_turn
            end
        end
        p "draw"
    end

end
            

