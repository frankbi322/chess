require_relative 'piece.rb'

class Board


  attr_accessor :grid


  def initialize
    @grid = Array.new(8){Array.new(8){Piece.new}}
    #middle 4 rows are empty at start_pos
    #top 2 and bottom 2 are peice rows
  end

  def move(start_pos, end_pos)
    #raise exception if no piece at start
  end

  def in_bounds(new_pos)
    self.move(start_pos,new_pos)
  end

end
