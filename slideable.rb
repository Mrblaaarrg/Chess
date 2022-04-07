require "byebug"
module Slideable
	def moves
        move_list = []
        move_list += check_straight if self.move_dirs.include?(:straight)
        move_list += check_diagonal if self.move_dirs.include?(:diagonal)
        move_list
    end

    def check_straight
        move_list = []
        row, col = self.current_position[0], self.current_position[1]
        # Check to the right
        (col + 1..7).each do |col_i|
            candidate_pos = [row, col_i]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        # Check down
        (row + 1..7).each do |row_i|
            candidate_pos = [row_i, col]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        # Check to the left
        (0...col).to_a.reverse.each do |col_i|
            candidate_pos = [row, col_i]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        # Check up
        (0...row).to_a.reverse.each do |row_i|
            candidate_pos = [row_i, col]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        move_list
    end

        def check_diagonal
            debugger
        move_list = []
        # Check up-right
        candidate_pos = self.current_position
        while self.board.in_bounds?(candidate_pos)
            candidate_pos = [candidate_pos[0] - 1, candidate_pos[1] + 1]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        # Check down-right
        candidate_pos = self.current_position
        while self.board.in_bounds?(candidate_pos)
            candidate_pos = [candidate_pos[0] + 1, candidate_pos[1] + 1]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        # Check down-left
        candidate_pos = self.current_position
        while self.board.in_bounds?(candidate_pos)
            candidate_pos = [candidate_pos[0] + 1, candidate_pos[1] - 1]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        # Check up-left
        candidate_pos = self.current_position
        while self.board.in_bounds?(candidate_pos)
            candidate_pos = [candidate_pos[0] - 1, candidate_pos[1] - 1]
            candidate_piece = self.board[candidate_pos]
            break if !self.board.in_bounds?(candidate_pos) || candidate_piece.color == self.color
            move_list << candidate_pos
            break unless candidate_piece.color.nil?
        end
        move_list
    end
end
