require 'colorize'
require_relative 'cursor.rb'
require 'byebug'

class Display

  attr_reader :board, :cursor

  def initialize(board, cursor = Cursor.new([0,0],board))
    @board = board
    @cursor = cursor
  end

  def render #to do
    system("clear")
    @board.grid.each_with_index do |row, idx1|

      result = []
      row.each_with_index do |el, idx2|
      #  byebug
        if @cursor.cursor_pos == [idx1,idx2]
          result << el.value.colorize({background: :green})
        else
          result << el.value
        end
        #puts el.value.colorize(:green) #if el.is_a?(Cursor)
      end
      puts result.join("  ")
    end
  end
end

#
# while true
#   disp.render
#   #debugger
#   disp.cursor.get_input
# end
