class Board
    def initialize(n)
        @board = Array.new(n) {Array.new(n, '_')}
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end


    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @board.length 
        end
    end
    
    def empty?(pos)
        @board[pos[0]][pos[-1]] == "_"
    end

    def place_mark(pos, mark)
        if self.valid?(pos) && self.empty?(pos)
            @board[pos[0]][pos[-1]] = mark
        else
            raise "This position is either not valid or not empty"
        end
    end 

    def print
        @board.each do |row|
            p row.join(" ")
        end
    end

    def win_row?(mark)
        @board.each do |row|
            if row.all? {|el| el == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        @board.transpose.each do |col|
            if col.all? {|el| el == mark}
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        res = []
        (0...@board.length).each do |i|
            res << @board[i][i]
        end

        return true if res.all?{|el| el == mark}
        res1 = []

        (0...@board.length).each do |i|
            res1 << @board[i][@board.length - 1 - i]
        end

        return true if res1.all?{|el| el == mark}
        false
    end

    def win?(mark)
        if win_row?(mark)
            return true
        elsif win_col?(mark)
            return true
        elsif win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        @board.each do |row|
            if row.any? {|el| el == "_"}
                return true
            end
        end
        false
    end

    def legal_positions
        legal = []
        @board.each_with_index do |row, i|
            row.each_with_index do |el, z|
                legal << [i, z] if el == "_"
            end
        end
        legal
    end
end


