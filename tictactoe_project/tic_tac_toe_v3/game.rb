require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize(n, players)
        @players = players.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
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
            choices = @board.legal_positions
            pos = @current_player.get_position(choices)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                p "Game Over"
                p "Victory for Player #{@current_player.mark}"
                return
            else
                self.switch_turn
            end
        end
        p "Game Over"
        p "DRAW"
    end

end
            

