
module Slideable
    #Constants
    #2d arrays of those directions
    HORIZONTAL_DIRS = [ [1,0], [0,1], [-1,0], [0,-1] ]
    DIAGONAL_DIRS = [ [1,1], [1,-1], [-1,1], [-1,-1] ]
    
    def moves
        #should not take in an arguement
        # p move_dirs
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
      
        until  !@board.valid_pos?([x+dx, y+dy])|| !@board[[x +dx, y+dy]].empty? 
        #until its a valid position or 
            dx += dir[0]
            dy += dir[1]
            if @board.valid_pos?([x+dx, y+dy])
                if @board[[x +dx, y+dy]].color != @board[[x, y]].color
                    dirmovs << [x+dx, y+dy]    
                end
            end
        end
        return dirmovs
    end
end