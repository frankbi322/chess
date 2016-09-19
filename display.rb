require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display

  attr_reader :board

  def initialize(board, cursor = Cursor.new([0,0],board))
    @board = board
    @cursor = cursor
  end

  def render #to do
    system("clear")
    @board.grid.each_with_index do |row, idx1|

      result = []
      row.each_with_index do |el, idx2|
        if @cursor.cursor_pos == [idx1,idx2]
          result << el.value.colorize(:green)
        else
          result << el.value
        end
        #puts el.value.colorize(:green) #if el.is_a?(Cursor)
      end
      puts result.join("  ")
    end

  end

end

b = Board.new
disp = Display.new(b)
disp.render
