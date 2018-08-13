-- It is a template to create another chess pieces
-- A Dummy does literally nothing and just stands on a cell,
-- waiting to be eaten.
-- So this is a good piece to be copied and tuned
require "piece"

export class Dummy extends Piece
    new: =>
        super!
        -- Override me!

    -- Setters
    set_pos: (pos_x, pos_y) =>
        super pos_x, pos_y
        -- Override me!

    set_player_id: (id) =>
        super id
        -- Override me!

    set_royal: (is_royal = true) =>
        super is_royal
        -- Override me!

    set_piece_class: (piece_class) =>
        super piece_class
        -- Override me!

    get_possible_moves: (pieces) =>
        super pieces
        -- Override me!
        -- I can't go anywhere, pls push me somebody...
