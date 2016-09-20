require 'colorize'
require_relative 'board'

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

  private

  def move_into_check?

  end

end
