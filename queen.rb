class Queen < SlidingPiece

  def value
    return "\u2655" if self.color == "white"
    "Q" if self.color == "black"
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
