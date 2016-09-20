class SlidingPiece < Piece

  def moves
    possible_moves = []
    move_dirs.each do |dir|
      moves = grow_unblocked_moves_in_dir(dir[0],dir[1]) #xy coord of new_pos
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

  def grow_unblocked_moves_in_dir(x,y)
    grow_moves = []
    move_dirs.each do |dir|
      new_pos = @position
      new_pos = [new_pos[0]+dir[0],new_pos[1]+dir[1]]

      while @board[new_pos].is_a?(NullPiece)
        grow_moves << new_pos
        new_pos = [new_pos[0]+dir[0],new_pos[1]+dir[1]]
      end

      if @board[new_pos].color != self.color
        grow_moves << new_pos
      end

    end
    grow_moves
  end

end
