class Queen < SlidingPiece

  def value
    return "\u2655" if self.color == "white"
    "Q" if self.color == "black"
  end

  def moves

  end

end
