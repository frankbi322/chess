class Knight < SteppingPiece

  def value


     return "\u2658" if self.color == "white"
     "k" if self.color == "black"
  end

  def move_dirs

  end

end
