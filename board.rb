require_relative 'piece.rb'
require_relative 'sliding_piece.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'pawn.rb'
require_relative 'stepping_piece.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
require_relative 'null_piece.rb'

class Board


  attr_accessor :grid

  def populate_white_pawns
    @grid[6].each_with_index.map{|el,idx| Pawn.new("white",[6,idx],self)}
  end

  def populate_black_pawns
    @grid[1].each_with_index.map{|el,idx| Pawn.new("black",[1,idx],self)}
  end

  def populate_black_pieces
    @grid[0].each_with_index.map{|el,idx| BLACK_ROW[idx].new("black",[0,idx],self)}
  end

  def populate_white_piece
    @grid[7].each_with_index.map{|el,idx| WHITE_ROW[idx].new("white",[7,idx],self)}
  end

  WHITE_ROW = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
  BLACK_ROW = [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]


  def initialize
    @null = NullPiece.instance

    @grid = Array.new(8){Array.new(8) {@null}}
    @grid[7]=populate_white_piece
    @grid[0]=populate_black_pieces
    @grid[1]=populate_black_pawns
    @grid[6]=populate_white_pawns

    #middle 4 rows are empty at start_pos
    #top 2 and bottom 2 are peice rows
  end

  def move(start_pos, end_pos)
    #raise StandardError.new "invalid move"
    #raise exception if no piece at start
    #replace start_pos with reference to null_piece
    #replace whatever's at end_pos (null_piece or piece of opposite color) with copy of moved piece

  end

  def in_bounds(new_pos)
    self.move(start_pos,new_pos)
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
  end


  def valid_move?
    #piece's move must be in moveset
    #piece must remain on the board
    #cannot take spot of same player color
    #cannot leave board in check against yourself as a result
  end

  def in_check?
    #pieces.current_player_color.any?{valid_move can occupy other king's position}
  end

  def checkmate?
      #other_color_pieces.none? {|piece| valid_move?}
  end



end
