class King < SteppingPiece

  def value
    return "\u2654" if self.color == "white"
    "K" if self.color == "black"
  end

  protected

  def move_dirs
    [
    [0,1], #horizontals and verticals
    [0,-1],
    [1,0],
    [-1,0],
    [1,1], #diagonals
    [-1,-1],
    [1,-1],
    [-1,1]
    ]
  end

end
