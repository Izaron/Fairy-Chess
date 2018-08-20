-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "util"

-- The Knight is a (1, 2)-leaper
export class Knight extends Piece
    image: "knight_white"
    dir: {1, 2}

    get_possible_moves: (board) =>
        return Util.leaper_moves(board, self, @dir)
