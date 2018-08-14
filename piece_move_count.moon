require "piece"

-- This is an inheritor of the base class with counting moves
-- Usable for Pawn (en passant, double move), Rook and King (castling)
export class PieceMoveCount extends Piece
    -- The constructor sets default values
    new: =>
        super!
        @move_count = 0

    -- Setters
    set_pos: (pos_x, pos_y) =>
        super pos_x, pos_y
        @move_count += 1

    set_move_count: (count) =>
        @move_count = count

    -- Getters
    get_move_count: =>
        @move_count
