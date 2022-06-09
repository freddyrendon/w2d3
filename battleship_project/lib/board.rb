class Board

    def self.print_grid(grid)
        grid.each { |x| puts x.join(" ") }
    end 

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n 
    end 

    def size
        return @size 
    end 

    def [](array)
        return @grid[array[0]][array[1]]
    end 

    def []=(pos, value)
        return @grid[pos[0]][pos[1]] = value
    end 

    def num_ships
        count = 0 
        @grid.each do |subarr|
            subarr.each do |ele|
                if ele == :S 
                    count += 1
                end
            end  
        end     
        return count 
    end 

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true 
        else 
            self[pos] = :X
            return false 
        end  
    end

    def place_random_ships
        total_spaces = @grid.length * @grid.length
        how_many_ships_to_place = total_spaces / 4.to_f # 25%

        while how_many_ships_to_place > num_ships

            rand_x = rand(0...@grid.length)
            rand_y = rand(0...@grid.length)
             @grid[rand_x][rand_y] = :S

        end 
    end 

    def hidden_ships_grid   
            new_arr = []
        @grid.each do |subarr|
            arr = []
            subarr.each do |ele|
                if ele == :S
                    arr << :N
                else 
                    arr << ele 
                end 
            end 
            new_arr << arr 
        end 
        return new_arr
    end 

    def cheat 
        Board.print_grid(@grid)
    end 

    def print 
        Board.print_grid(self.hidden_ships_grid)
    end 


end
