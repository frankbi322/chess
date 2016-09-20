class King < SteppingPiece

  def value
    return "\u2654" if self.color == "white"
    "K" if self.color == "black"
  end

  def move_dirs

  end

end
