require_relative 'stepping_piece.rb'

class Knight < SteppingPiece

  def value
     return "\u2658" if self.color == "white"
     "k" if self.color == "black"
  end

  def move_dirs
    [
    [1,2],
    [1,-2],
    [2,1],
    [2,-1],
    [-1,2],
    [-1,-2],
    [-2,1],
    [-2,-1]
    ]
  end

end
