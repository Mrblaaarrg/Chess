require "colorize"
require_relative "cursorable"

class Display
	include Cursorable

	def initialize(board)
		@board = board
		@cursor_pos = [0, 0]
	end

	def build_grid
		@board.rows.map.with_index do |row, i|
			build_row(row, i)
		end
	end

	def build_row(row, i)
		row.map.with_index do |piece, j|
			color_options = colors_for(i, j)
			piece.to_s.colorize(color_options)
		end
	end

	def colors_for(i, j)
		cl = @board[[i,j]].color

		if [i, j] == @cursor_pos
			bg = :light_red
			md = :blink
		elsif (i + j).even?
			bg = :white
			md = :bold
		else
			bg = :black
			md = :bold
		end
		{ color: cl, background: bg, mode: md }
	end

	def update_pos(diff)
		new_pos = [@cursor_pos[0] + diff[0], @cursor_pos[1] + diff[1]]
		@cursor_pos = new_pos if @board.in_bounds?(new_pos)
	end

	def render
		system("clear")
		puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
		build_grid.each { |row| puts row.join }
		true
	end
end
