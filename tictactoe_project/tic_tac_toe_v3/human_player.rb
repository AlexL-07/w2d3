class HumanPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        move = nil
        until legal_positions.include?(move)
            p "Player #{mark.to_s}, enter your desired position here as two numbers with a single space in between the numbers"
            move = gets.chomp.split(' ').map(&:to_i)
            p "#{move} is not a legal position" if !legal_positions.include?(move)
            raise 'sorry, that was invalid' if move.length != 2
        end
        move
    end
end
