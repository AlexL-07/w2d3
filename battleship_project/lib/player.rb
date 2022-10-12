class Player
    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        move = gets.chomp.split(" ")
        move[0] = move[0].to_i
        move[-1] = move[-1].to_i
        move
    end
end
