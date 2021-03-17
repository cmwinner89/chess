class Piece

    attr_reader :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "<Piece: color= #{@color} pos = #{@pos}>"
    end

    def empty?
        false
    end

    def valid_moves
        #loop through the board and look at al lthe piece objects
        #if nil then add them to return array
        #if diff color then add to return array
        # moves = []

        # @board.each do |rows|
        #     rows.each do |piece|
        #         if piece == nil #refactor to NullPiece
        #             # moves << piece.pos
        #         end
        #         if @color != piece.color
        #             moves << piece.pos
        #         end
        #     end
        # end
        # moves
    end

    def pos=(val)
        # @pos = val
        # @board[val] = self
    end

    private 
    def move_into_check?(end_pos)
    #     #check valid_moves of all other colored pieces
    #     #if we move into one of those moves 
    #     #then we are moving into check
    #     all_valid_moves = []
    #     @board.each do |rows|
    #         @rows.each do |piece|
    #             if piece.color != @color
    #                 all_valid_moves += piece.valid_moves
    #             end
    #         end
    #     end
    #     all_valid_moves.include?(end_pos)
    end
end

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
        until x+dx > 7 || y+dy > 7 || x+dx < 0 || y+dy < 0
            dirmovs << [x+dx, y+dy]
            dx += dir[0]
            dy += dir[1]
        end
        return dirmovs
    end
end

class Rook < Piece
    include Slideable

    private
    #Rook.move_dirs returns
    #horiz/vertical]
    def move_dirs
        # self.valid_moves && Slideable.moves
        # then we can move there

        #dont have to think too much
        #returns the constant variables

        # the constants are availiable to rook
        # rook can use the constants and public methods
        HORIZONTAL_DIRS
    end
end



class Bishop < Piece
    include Slideable

    def move_dirs
        DIAGONAL_DIRS
    end
end

class Queen < Piece
    include Slideable
    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end

module Stepable

end

class Knight < Piece
    include Stepable

    def move_diffs
        # array of the 8 things a knight can do
    end
end

class King < Piece
    include Stepable

    def move_diffs
        # array of the 8 things a king can do
    end
end



class Pawn < Piece
  
end

class NullPiece < Piece
    
end