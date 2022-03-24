class Piece
	def initialize(current_position, color)
		@current_position = current_position
		@color = color
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