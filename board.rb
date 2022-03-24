require "byebug"
require_relative "piece"

class Board
	attr_reader :rows

	def initialize
		@rows = Array.new(8) { Array.new(8) }
	end

	def set_starting_pieces
		self.set_main_pieces(:black)
		self.set_main_pieces(:white)
		self.set_pawns(:black)
		self.set_pawns(:white)
		self.set_null_pieces
	end

	def set_main_pieces(color)
		row = color == :black ? 0 : -1
		self[[row, 0]], self[[row, -1]] = TowerPiece.new(self, [row, 0], color), TowerPiece.new(self, [row, -1], color)
		self[[row, 1]], self[[row, -2]] = HorsePiece.new(self, [row, 1], color), HorsePiece.new(self, [row, -2], color)
		self[[row, 2]], self[[row, -3]] = BishopPiece.new(self, [row, 2], color), BishopPiece.new(self, [row, -3], color)
		self[[row, 3]] = QueenPiece.new(self, [row, 3], color)
		self[[row, 4]] = KingPiece.new(self, [row, 4], color)
	end

	def set_pawns(color)
		corresponding_row = { white: 1, black: -2}
		(0...self.size).each do |col|
			row = corresponding_row[color]
			pos = [row, col]
			self[pos] = PawnPiece.new(self, pos, color)
		end
	end

	def set_null_pieces
		(2...self.size - 2).each do |row|
			(0...self.size).each do |col|
				pos = [row, col]
				self[pos] = NullPiece.new(pos)
			end
		end
		true
	end

	def [](pos)
		row, col = pos
		rows[row][col]
	end

	def []=(pos, value)
		row, col = pos
		@rows[row][col] = value
	end

	def size
		rows.count
	end

	def in_bounds?(pos)
		pos.all? { |coord| (0...@rows.length).include?(coord) }
	end

	def move_piece(start_pos, end_pos)
		raise MoveError.new "No piece at start position" if self[start_pos].is_a?(NullPiece)
		destination_piece = self[end_pos]
		self[start_pos], self[end_pos] = self[end_pos], self[start_pos] if destination_piece.is_a?(NullPiece)
	end
end

class MoveError < StandardError
end