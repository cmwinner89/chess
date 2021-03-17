require_relative "./pieces/piece"
require_relative "./pieces/rook"
require_relative "./pieces/bishop"
require_relative "./pieces/queen"
require_relative "./pieces/knight"
require_relative "./pieces/king"
require_relative "./pieces/pawn"
require_relative "./pieces/null_piece"

class Board

    attr_reader :rows
    def initialize
        #potentially refactor as its own method
        @rows = Array.new(8) {Array.new(8, nil)}
        fill_board
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @rows[x][y] = value
    end

    def move_piece(start_pos, end_pos)

        #raise exception if no piece at start pos or if cannot move to end pos
        raise "no piece there" if self[start_pos].nil?

        #cannot move to end pos if out of bounds (maybe factor out as a method)
        #later: or in any way an invalid move
        endx, endy = end_pos
        raise "out of bounds end pos" if endx > 7 || endy > 7 || endx < 0 || endy < 0

        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    private
    def fill_board
        #populate your board

        #set other black pieces
        self[[0, 0]] = Rook.new(:black, self, [0, 0])
        self[[0, 1]] = Knight.new(:black, self, [0, 1])
        self[[0, 2]] = Bishop.new(:black, self, [0, 2])
        self[[0, 3]] = Queen.new(:black, self, [0, 3])
        self[[0, 4]] = King.new(:black, self, [0, 4])
        self[[0, 5]] = Bishop.new(:black, self, [0, 5])
        self[[0, 6]] = Knight.new(:black, self, [0, 6])
        self[[0, 7]] = Rook.new(:black, self, [0, 7])

        #set black pawns
        8.times do |i|
            self[[1, i]] = Pawn.new(:black, self, [1, i]) 
        end
        
        #set other white pieces
        self[[7, 0]] = Rook.new(:white, self, [7, 0])
        self[[7, 1]] = Knight.new(:white, self, [7, 1])
        self[[7, 2]] = Bishop.new(:white, self, [7, 2])
        self[[7, 3]] = Queen.new(:white, self, [7, 3])
        self[[7, 4]] = King.new(:white, self, [7, 4])
        self[[7, 5]] = Bishop.new(:white, self, [7, 5])
        self[[7, 6]] = Knight.new(:white, self, [7, 6])
        self[[7, 7]] = Rook.new(:white, self, [7, 7])

        #set white pawns 
        8.times do |i|
            self[[6,i]] = Pawn.new(:white, self, [6, i]) 
        end

        #Set null pieces on the board
        (2..5).each do |i|
            (0..7).each do |j|
                self[[i, j]] = NullPiece.instance
            end
        end
    end
end