require_relative 'piece.rb'

class SteppingPiece < Piece

  def moves
    possible_moves = []
    move_dirs.each do |dir|
      possible_moves << [@position[0]+dir[0],@position[1]+dir[1]]
    end
    possible_moves
  end

  def move_dirs

  end

end
