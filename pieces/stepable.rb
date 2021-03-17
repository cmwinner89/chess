module Stepable
    def moves
        movs = []
        x, y = self.pos

        self.move_diffs.each do |diff|
            dx = diff[0]
            dy = diff[1]

            if x+dx > 7 || y+dy > 7 || x+dx < 0 || y+dy < 0
                #do nothing
            elsif   @board[x][y].color == @board[x+dx][y+dy].color
                #do nothing
            else
                movs << [x+dx, y+dy]
            end

        end
        movs
    end

    private
    def move_diffs
        raise "Unimplemented Method Error"
    end
end