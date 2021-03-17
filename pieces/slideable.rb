
module Slideable
    #Constants
    #2d arrays of those directions
    HORIZONTAL_DIRS = [ [1,0], [0,1], [-1,0], [0,-1] ]
    DIAGONAL_DIRS = [ [1,1], [1,-1], [-1,1], [-1,-1] ]
    
    def moves(dirs)
        #iterate through the constant arrays
        #try to get all the moves thats possible for the current pos
        movs = []
        
        move_dirs.each do |dir|
            dx, dy = dir
            movs += grow_unblocked_moves_in_dir(dx,dy)
        end

        return movs
    end

    private
    def move_dirs
        #raise an error
        #we need it to make sure dev implements it in rook
        raise "You need to override move_dirs in your piece classes"
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        dirmovs = []
        dir = [dx,dy]
        x,y = self.pos
        until x+dx > 7 || y+dy > 7 || x+dx < 0 || y+dy < 0 || !@board[x +dx][y+dy].empty? 
            if @board[x +dx][y+dy].color != @board[x][y].color
                dirmovs << [x+dx, y+dy]
                dx += dir[0]
                dy += dir[1]
            end
        end
        return dirmovs
    end
end