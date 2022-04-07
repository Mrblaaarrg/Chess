require_relative "slideable"
require_relative "steppable"

class Piece

	attr_reader :board, :color, :current_position
	
	def initialize(board, current_position, color)
		@board, @current_position, @color = board, current_position, color
	end

	def update_pos(new_pos)
		@current_position = new_pos
	end

	def inspect
		{
			"board_id" => @board.object_id,
			"piece_type" => self.class,
			"piece_id" => self.object_id,
			"color" => @color,
			"current_position" => @current_position
		}.inspect
	end
end

class NullPiece < Piece
	def initialize(current_position)
		@current_position = current_position
	end

	def to_s
		" "
	end
end

class TowerPiece < Piece
	include Slideable

	def move_dirs
		[:straight]
	end

	def to_s
		"T"
	end
end

class BishopPiece < Piece
	include Slideable

	def move_dirs
		[:diagonal]
	end

	def to_s
		"B"
	end
end

class QueenPiece < Piece
	include Slideable

	def move_dirs
		[:diagonal, :straight]
	end

	def to_s
		"Q"
	end
end

class KingPiece < Piece
	include Steppable

	def move_dirs
		[:diagonal, :straight]
	end

	def to_s
		"K"
	end
end

class HorsePiece < Piece

	def to_s
		"H"
	end
end

class PawnPiece < Piece

	def to_s
		"p"
	end
end