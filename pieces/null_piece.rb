require_relative "piece"
require "singleton"
class NullPiece < Piece
    include Singleton
    
    attr_reader :color, :symbol

    def initialize
        color = nil
        symbol = '_'
    end

    def empty?
        return true
    end
end