require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'human_player.rb'
require_relative 'display.rb'

class Game

  def initialize(white,black)
    @white = white
    @black = black
    @current_player = @white
    @board = Board.new()
    @display = Display.new(@board)
  end

  def play
    until game_over?
      play_turn
      # change_turns
    end
  end

  def play_turn
      coord =[]
    while true
      @display.render
      input = @display.cursor.get_input
        if !input.nil?
          coord << input
          input = nil
        end
        if coord.length==2
        from_pos = coord[0]
        to_pos = coord[1]
        #debugger
        @board.move(from_pos,to_pos)
        coord = []
        input = nil
      end

    end

  end


  def game_over?
    @board.checkmate?(@current_player)
  end

  private

  def notify

  end

  # def change_turns
  #   @current_player == player1 ? @current_player = player2 : @current_player = player1
  # end

end

game = Game.new("white","black").play
