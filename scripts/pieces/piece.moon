-- This is the base class for all pieces, contains most common functions
--
-- Every piece has some variables - 'player_id' (either 0 or 1),
-- the position (0-based), 'is_royal' boolean value, shows if the piece
-- is critical and shouldn't be eaten no way (as the King in vanilla chess)
-- the path to image, built as 'assets/'..image..'.png' if provided
--
-- To create a new piece type you should extend this class, like:
-- export class Pawn extends Piece ...
-- Look at examples in this folder around
-- 
-- You can copy the "dummy.moon" file and write your own piece logic
export class Piece
    -- Each piece has its own global and local values
    @is_royal: false
    @image: ""

    new: =>
        @player_id = 0
        @pos = {0, 0}

    -- Setters
    set_pos: (pos_x, pos_y) =>
        @pos = {pos_x, pos_y}

    set_player_id: (id) =>
        @player_id = id

    set_piece_class: (piece_class) =>
        @__class = piece_class  -- Change the piece class - like if it was
                                -- a pawn which went to the border

    -- Getters
    get_pos: =>
        @pos

    get_player_id: =>
        @player_id

    is_royal: =>
        @is_royal

    get_image: (image) =>
        @image

    get_name: =>  -- Returns the class name as a string
        @__class.__name
    
    get_class: =>  -- Returns a pointer to the class table
        @__class

    -- The functions to be overriden in child classes
    get_possible_moves: (board) =>  -- 'board' represented as a table,
                                    -- containing all pieces
        -- Return nothing
