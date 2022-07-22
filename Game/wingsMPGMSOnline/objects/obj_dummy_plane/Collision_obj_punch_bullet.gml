/// @description Insert description here
// You can write your code in this editor

var shotdir = point_direction(other.x,other.y,x,y);
//var damping = 5;

hp -= 35;

//instance_destroy(other);

part_emitter_region(ps_explosion, pe_explosion, x, x, y, y, 0, 1);
part_type_direction(pt_explosion, shotdir-5, shotdir+5, 0, 22);
part_emitter_burst(ps_explosion, pe_explosion, pt_explosion, 9);