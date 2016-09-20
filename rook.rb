class Rook < SlidingPiece

  def value
    return "\u2656" if self.color == "white"
    "R" if self.color == "black"
  end

  def move_dirs

  end
end
