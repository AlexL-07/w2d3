require_relative "board"
require_relative "player"

class Battleship
    
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        p "There are #{@board.num_ships} hidden ships on the board."
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win?
            return true
        elsif self.lose?
            return true
        else 
            return false
        end
    end

    def turn
        pos = @player.get_move
        @remaining_misses -= 1 if !@board.attack(pos)
        @board.print
        p "#{@remaining_misses} remaining misses"
    end


end
