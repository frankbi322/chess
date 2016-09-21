require_relative 'piece.rb'
require 'byebug'

class SlidingPiece < Piece

  def moves
    possible_moves = []
    move_dirs.each do |move_dir|
      moves = grow_unblocked_moves_in_dir(move_dir)
      moves.each do |move|
        possible_moves << move
      end
    end
    possible_moves
  end

  private

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


  private

  def grow_unblocked_moves_in_dir(move_dir)
    grow_moves = []
      new_pos = @position
      new_pos = [new_pos[0] + move_dir[0] , new_pos[1] + move_dir[1]]
      return grow_moves if new_pos[0] < 0 || new_pos[0] > 7 || new_pos[1] < 0 || new_pos[1] >7
      while @board[new_pos].is_a?(NullPiece)
        grow_moves << new_pos
        new_pos = [new_pos[0]+move_dir[0],new_pos[1]+move_dir[1]]
      end

      if @board[new_pos].is_a?(Piece) && @board[new_pos].color != self.color
        grow_moves << new_pos
      end

    grow_moves
  end

end
