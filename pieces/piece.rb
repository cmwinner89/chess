require "colorize"

class Piece

    attr_reader :pos, :color, :board

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















