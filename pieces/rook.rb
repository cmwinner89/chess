require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        'rook'.colorize(color)
    end
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
