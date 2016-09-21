require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'pawn.rb'
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

  WHITE_ROW = [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
  BLACK_ROW = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]


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
    self[start_pos].valid_moves.include?(end_pos)
      self[end_pos] = self[start_pos]
      self[start_pos] = @null


    #raise StandardError.new "invalid move"
    #raise exception if no piece at start
    #replace start_pos with reference to null_piece
    #replace whatever's at end_pos (null_piece or piece of opposite color) with copy of moved piece
    #need to implement move! method for move check
    #move method can use move! method
      #move! is actual move
      #move is the checker, then do move!
  end

  def in_bounds(new_pos)
    self.move(start_pos,new_pos)
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,piece)
    x,y = pos
    @grid[x][y] = piece #does this create a piece.new?
  end

  def in_check?(color)
    black_pieces = []
    white_pieces = []
    white_king_pos = []
    black_king_pos = []

    @grid.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        white_pieces << el if el.is_a?(Piece) && el.color == "white"
        black_pieces << el if el.is_a?(Piece) && el.color == "black"

        if @grid[idx1,idx2].is_a?(King) && @grid[idx1,idx2].color == "white"
          white_king_pos = [idx1,idx2] #double check if syntactic sugar works
        end

        if @grid[idx1,idx2].is_a?(King) && @grid[idx1,idx2].color == "black"
          black_king_pos = [idx1,idx2]
        end

      end
    end

    if color == "white"
      black_pieces.each do |piece|
        piece.valid_moves.any? {|move| move == white_king_pos}
      end
    elsif color == "black"
      white_pieces.each do |piece|
        piece.valid_moves.any? {|move| move == black_king_pos}
      end
    end
  end

  def checkmate?(color)
    black_pieces = []
    white_pieces = []
    @grid.each_with_index do |row|
      row.each_with_index do |el|
        white_pieces << el if el.is_a?(Piece) && el.color == "white"
        black_pieces << el if el.is_a?(Piece) && el.color == "black"
      end
    end

    if color == "black"
      return true if black_pieces.all? {|piece| piece.valid_moves.empty?}
    end
    if color == "white"
      return true if white_pieces.all? {|piece| piece.valid_moves.empty?}
    end
      #other_color_pieces.none? {|piece| valid_move?}
  end
end

board = Board.new
