/// @description Insert description here
// You can write your code in this editor

var shotdir = point_direction(other.x,other.y,x,y);
var damping = 5;

hp -= 4;

instance_destroy(other);

part_emitter_region(ps_smoke_puff, pe_smoke_puff, x, x, y, y, 0, 1);
part_type_direction(pt_smoke_puff, shotdir-damping, shotdir+damping, 0, 22);
part_emitter_burst(ps_smoke_puff, pe_smoke_puff, pt_smoke_puff, 9);