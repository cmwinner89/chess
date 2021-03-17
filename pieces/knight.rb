require_relative "piece"
require_relative "stepable"
class Knight < Piece
    include Stepable

    def symbol
        " ♞ ".colorize(color)
    end
    protected
    def move_diffs
        # array of the 8 things a knight can do
        move_dirs = 
        [ 
        [2,  1],[1,  2],
        [2, -1],[1, -2],
        [-2, 1],[-1, 2],
        [-2,-1],[-1,-2]
        ]

    end
end