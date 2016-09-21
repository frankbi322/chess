require 'colorize'

class Piece

  attr_accessor :value, :color, :position, :board

  def initialize (color,position,board)
    @value = value
    @color = color
    @position = position
    @board = board
  end

  def moves
    #array of possible moves
  end

  def to_s
    self.value.colorize(:@color)
  end

  def valid_moves
    moves.select do |move|
      move[0]>=0 && move[0]<=7 &&#move (new coord) is within the board, refactor to check in bounds
      move[1]>=0 && move[1]<=7 &&
      @board[move].is_a?(Piece) && @board[move].color != @color && #move doesn't end up in same color, double check if syntax works. try if *move works
      !move_into_check?(move)
    end
    moves
  end


  private

  def move_into_check?(new_pos)
    new_board = @board.deep_dup
    new_board.move(@position, new_pos)
    new_board.in_check?(@color)
  end

end


class Array
  def deep_dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end
end
