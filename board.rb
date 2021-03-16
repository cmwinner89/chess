require_relative "./piece.rb"
class Board

    attr_reader :rows
    def initialize
        #potentially refactor as its own method
        @rows = Array.new(2) {Array.new(8) {Piece.new}}
        @rows += Array.new(6) {Array.new(8) }
        @rows += Array.new(2) {Array.new(8) {Piece.new}}
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
end