/// @description Insert description here
// You can write your code in this editor


//dir = 0;
wEffect=false;
dir = direction-180;
image_speed = 0;

part_type_direction(pt_laserlines, dir, dir, 0, 72);
part_emitter_region(ps_laserlines, pt_laserlines, x, x, y, y, 0, 1);
part_emitter_burst(ps_laserlines, pt_laserlines, pt_laserlines, 9);

alarm[0]=2;