require_relative "board"
require "colorize"
require_relative "cursor"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new( [0,0],board)
    end

    def render
        @board.rows.each_with_index do |row, r_idx|
            
            row.each_with_index do |piece, c_idx|
                if [r_idx, c_idx] == @cursor.cursor_pos
                    print piece.symbol.colorize(:background => :red)
                else
                    print piece.symbol
                end         
            end
            print "\n"
        end
    end

    def render_input
        while true
            render
            @cursor.get_input
        end
    end
end