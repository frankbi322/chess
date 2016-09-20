class Pawn < Piece

  def value
    return "\u2659" if self.color == "white"
    "P" if self.color == "black"
  end

  def moves #return array of updated positions our pawns can end up in
    if self.color == "white"
      possible_white_moves
    else
      possible_black_moves
    end
  end

  def possible_white_moves
    possible_moves = []

      if (@position[1]-1).is_a?(NullPiece) #can't move up if something blocking us
        possible_moves << [@position[0],@position[1]-1]

          if @position[1] == 6 && (@position[1]-2).is_a?(NullPiece) #if we're on starting row and two vertical spaces later is empty
            possible_moves << [@position[0],@position[1]-2]
          end
      end

      if [@position[0]+1,@position[1]-1].color=="black" #up right is a black piece
        possible_moves << [@position[0]+1,@position[1]-1]] #move diagonal and take
      end

      if [@position[0]-1,@position[1]-1].color=="black" #up left
        possible_moves << [@position[0]-1,@position[1]-1]]
      end
      possible_moves
  end

  def possible_black_moves
    possible_moves = []
    if (@position[1]+1).is_a?(NullPiece)
      possible_moves << [@position[0],@position[1]+1]

        if @position[1] == 1 && (@position[1]+2).is_a?(NullPiece)
          possible_moves << [@position[0],@position[1]+2]
        end
    end

    if [@position[0]+1,@position[1]+1].color=="white" #down right is a white piece
      possible_moves << [@position[0]+1,@position[1]+1]]
    end

    if [@position[0]-1,@position[1]+1].color=="white" #down left
      possible_moves << [@position[0]-1,@position[1]+1]]
    end
    possible_moves
  end

end
