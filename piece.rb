require_relative "slideable"
require_relative "steppable"

class Piece
	def initialize(board, current_position, color)
		@board, @current_position, @color = board, current_position, color
	end

	def to_s
		"$"
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

	def to_s
		"T"
	end
end

class BishopPiece < Piece
	include Slideable

	def to_s
		"B"
	end
end

class QueenPiece < Piece
	include Slideable

	def to_s
		"Q"
	end
end

class KingPiece < Piece
	include Steppable

	def to_s
		"K"
	end
end

class HorsePiece < Piece
	include Steppable

	def to_s
		"H"
	end
end

class PawnPiece < Piece

	def to_s
		"p"
	end
end