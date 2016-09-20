class Bishop < SlidingPiece

  def value
    return "\u2657" if self.color == "white"
    return "B" if self.color == "black"
  end

  protected

  def move_dirs
    [
    [1,1],
    [-1,-1],
    [1,-1],
    [-1,1]
    ]
  end

end
