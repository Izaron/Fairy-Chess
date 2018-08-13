require "piece"
require "pawn"

p = Pawn!
p\set_pos(i, i) for i = 1, 10
print p.move_count
print p\get_name!
pp = p\get_pos!
print pp[1]
print pp[2]
print #pp
