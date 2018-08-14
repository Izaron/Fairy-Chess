-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "util"

-- The Knight is a (1, 2)-leaper
export class Knight extends Piece
    dirs: {
        {1, 2}, {2, 1}, {-1, 2}, {-2, 1},
        {1, -2}, {2, -1}, {-1, -2}, {-2, -1},
    }

    get_possible_moves: (board) =>
        return Util.leaper_moves_in_dirs(board, self, @dirs)
