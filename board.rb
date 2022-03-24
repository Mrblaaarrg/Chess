require_relative "piece"

class Board
	attr_reader :rows

	def initialize
		@rows = Array.new(8) { Array.new(8) }
	end

	def set_starting_pieces
		(0..7).each do |col|
			self.rows[0][col] = Piece.new
		end
	end

	def in_bounds?(pos)
		pos.all? { |coord| (0...@rows.length).include?(coord) }
	end
end