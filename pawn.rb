class Pawn < Piece

  def value
    return "\u2659" if self.color == "white"
    "P" if self.color == "black"
  end

  def moves

  end

end
