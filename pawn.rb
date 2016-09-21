require_relative 'piece.rb'

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
      up_right = @board[[@position[0]+1 , @position[1] - 1 ]]
      if up_right.is_a?(Piece) && up_right.color=="black" #up right is a black piece
        possible_moves << [@position[0]+1,@position[1]-1] #move diagonal and take
      end

      up_left = @board[[@position[0]-1,@position[1]-1]]
      if up_left.is_a?(Piece) && up_left.color=="black" #up left
        possible_moves << [@position[0]-1,@position[1]-1]
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

    down_right = @board[@position[0]+1,@position[1]+1]
    if down_right.is_a?(Piece) && down_right.color=="white" #down right is a white piece
      possible_moves << [@position[0]+1,@position[1]+1]
    end

    down_left = @board[@position[0]-1,@position[1]+1]
    if down_left.is_a?(Piece) && down_left.color=="white" #down left
      possible_moves << [@position[0]-1,@position[1]+1]
    end
    possible_moves
  end

end
