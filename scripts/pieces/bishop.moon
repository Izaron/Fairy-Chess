-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "util"

-- The Bishop is a (1, 1)-rider of all four diagonal directions
export class Bishop extends Piece
    dir: {1, 1}

    get_possible_moves: (board) =>
        return Util.rider_moves(board, self, @dir)
