require_relative "piece"
require_relative "stepable"
class King < Piece
    include Stepable

    def symbol
        "♚".colorize(color)
    end

    protected
    def move_diffs
        # array of the 8 things a king can do
        move_dirs =
        [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1],
            [1, 1],
            [-1, -1],
            [1, -1],
            [-1,1]
        ]
    end 
end