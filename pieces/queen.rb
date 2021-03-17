require_relative "piece"
require_relative "slideable"
class Queen < Piece
    include Slideable

    def symbol
        'queen'.colorize(color)
    end

    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end
