class HumanPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Enter your desired position here as two numbers with a single space in between the numbers"
        move = gets.chomp.split(' ').map(&:to_i)
        numbers = "0123456789"
        raise "Please input exactly 2 numbers." if move.length != 2
        raise "Please only use numbers." if !numbers.include?(move[0].to_s) || !numbers.include?(move[-1].to_s)
        move
    end
end
