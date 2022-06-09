class Player
    def get_move
        print "enter a position with coordinates se[rated with a space like `4 `7"
        user = gets.chomp 
        return user.split(" ").map(&:to_i)
    end 

end
