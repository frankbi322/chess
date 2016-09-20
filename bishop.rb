class Bishop < SlidingPiece

  def value
    return "\u2657".white if self.color == "white"
    "B" if self.color == "black"
  end

  def moves

  end

end
