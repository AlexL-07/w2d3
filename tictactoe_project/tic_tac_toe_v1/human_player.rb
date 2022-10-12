class HumanPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Enter your desired position here as two numbers with a single space in between the numbers"
        move = gets.chomp.split
        numbers = "0123456789"
        move.each do |el|
            raise "Please only use numbers." if !numbers.include?(el)
        end

        raise "Please input exactly 2 numbers." if move.length != 2
        move.map! {|el| el.to_i}
    end
end
