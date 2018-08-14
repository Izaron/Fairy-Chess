require "config"
require "bishop"
require "queen"
require "../love/knight"
require "rook"

board = {}
for i = 0, Config.rows
    board[i] = {}

p = Knight()
p\set_pos(6, 3)
moves = p\get_possible_moves(board)
print #moves
print "#{move[1]} #{move[2]}" for move in *moves
