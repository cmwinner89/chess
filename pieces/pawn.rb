require_relative "piece"
class Pawn < Piece
    def symbol
        ' ♟︎ '.colorize(color)
    end

    def moves
        movs = []
        
        # if a piece is blocking us (one square or two)
        if @board[forward_steps[0]].empty?
            movs << forward_steps[0]
        end
        if @board[forward_steps[1]].empty? && at_start_row?
            movs << forward_steps[1]
        end
        if !@board[side_attacks[0]].empty? && @board[side_attacks[0]].color != self.color
            movs << side_attacks[0]
        end
        if !@board[side_attacks[1]].empty? && @board[side_attacks[1]].color != self.color
            movs << side_attacks[1]
        end

        return movs

    end

    private
    def at_start_row?
        if self.color == :white && self.pos[0] == 6
            return true
        elsif self.color == :black && self.pos[0] == 1
            return true
        end
        false
    end

    def forward_dir
        if self.color == :black
            return 1
        elsif self.color == :white
            return -1
        end
    end

    def forward_steps
        
        #return [ [pos of move forward one], [pos of move forward two] ]

        return [[forward_dir + self.pos[0]    , self.pos[1]],
                [(forward_dir*2) + self.pos[0], self.pos[1]] ]
    end

    def side_attacks
        #return [ [pos of move diag left], [pos of move diag right] ]
        return [[forward_dir + self.pos[0], self.pos[1] - 1], 
        [forward_dir + self.pos[0], self.pos[1] + 1]]
    end
end