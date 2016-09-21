require_relative 'sliding_piece.rb'

class Rook < SlidingPiece

  def value
    return "\u2656" if self.color == "white"
    "R" if self.color == "black"
  end

  protected

  def move_dirs
    [
    [0,1], #verticals and horizontals
    [0,-1],
    [1,0],
    [-1,0]
    ]
  end
end
