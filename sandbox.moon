require "piece"
require "pawn"
require "rook"
require "config"

board = {}
for i = 0, Config.rows
    board[i] = {}

p = Rook!
p\set_pos(3, 6)
moves = p\get_possible_moves board
print #moves
print "#{move[1]} #{move[2]}" for move in *moves
