class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n 
    end

    def size
        @size
    end

    def [](pos)
        @grid[pos[0]][pos[-1]]
    end

    def []=(pos, v)
        @grid[pos[0]][pos[-1]] = v
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |el|
                count += 1 if el == :S
            end
        end
        count
    end 

    def attack(pos)
        if self.[](pos) == :S
            self.[]=(pos, :H) 
            p "you sunk my battleship!"
            return true
        else
            self.[]=(pos, :X) 
            return false
        end
    end

    def place_random_ships
        num = @size / 4

        while self.num_ships < num
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        hidden = @grid.map do |row|
            row.map do |el|
                if el == :S
                    :N 
                else
                    el
                end
            end
        end
        hidden
    end

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end  
end
