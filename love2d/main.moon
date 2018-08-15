package.path = "?.lua;" .. package.path
package.path = "pieces/?.lua;" .. package.path

require "assets"
require "knight"


-- Local variables
{:cell_size, :white_color, :black_color, :rows, :columns, :font_size} = settings
white_modulo = 0  -- Either 0 or 1, shows which color will have the top left cell


-- Generates a table of positions in chess order
gen_lattice = (mod) ->
    [{x, y} for x = 0, (columns - 1) for y = 0, (rows - 1) when (x + y) % 2 == mod]


-- Sets drawing color from settings
set_graphics_color = (color) ->
    love.graphics.setColor(color["red"], color["green"], color["blue"])


-- Draws a chess cell
draw_chess_cell = (index_x, index_y, size) ->
    love.graphics.rectangle("fill", index_x * size, index_y * size, size, size)


-- Draws both white and black cells
draw_cells = ->
    -- Draw white cells
    set_graphics_color(white_color)
    for pos in *gen_lattice(white_modulo)
        draw_chess_cell(pos[1], pos[2], cell_size)

    -- Draw black cells
    set_graphics_color(black_color)
    for pos in *gen_lattice(1 - white_modulo)
        draw_chess_cell(pos[1], pos[2], cell_size)


-- Draws cues - numbers on the first column and letters on the first row
draw_cues = ->
    -- Draw letters
    col_index = (white_modulo + rows) % 2
    for i = 0, (columns - 1)
        set_graphics_color(if col_index == 0 then white_color else black_color)
        col_index = 1 - col_index

        love.graphics.print(string.char(97 + i),
            math.floor((i + 1) * cell_size - font_size / 1.5),
            math.floor(rows * cell_size - font_size * 1.2))

    -- Draw numbers
    col_index = (white_modulo + 1) % 2
    for i = 0, (rows - 1)
        set_graphics_color(if col_index == 0 then white_color else black_color)
        col_index = 1 - col_index

        love.graphics.print(tostring(rows - i), 0,
            i * cell_size)


draw_piece = (piece) ->
    {pos_x, pos_y} = piece\get_pos()
    img = Assets.images[piece\get_image()]
    love.graphics.draw(img, pos_x * cell_size, pos_y * cell_size, 0,
        cell_size / img\getWidth())


local knight

love.load = ->
    Assets.load_all()
    love.graphics.setNewFont(font_size)
    knight = Knight()


-- The main draw function
cnt = 0
cnt_y = 0
love.draw = ->
    draw_cells()
    draw_cues()
    love.graphics.setColor(1, 1, 1)
    knight\set_pos(math.floor(cnt / 10), cnt_y)
    cnt += 1
    if cnt == columns * 10
        cnt = 0
        cnt_y += 1
        cnt_y %= rows
    draw_piece(knight)
