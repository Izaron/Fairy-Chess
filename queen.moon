-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "util"
moon = require "moon"

-- The Queen is a (1, 0)- and (1, 1)-rider
export class Queen extends Piece
    dirs: {
        {1, 0}, {1, 1}
    }

    get_possible_moves: (board) =>
        res = {}
        for dir in *@dirs
            moon.mixin_table(res, Util.rider_moves(board, self, dir))
        return res
