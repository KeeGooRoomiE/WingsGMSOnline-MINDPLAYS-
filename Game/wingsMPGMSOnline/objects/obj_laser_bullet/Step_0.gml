/// @description Insert description here
// You can write your code in this editor

image_angle = direction;

if (y >= global.water_y)
{
	instance_create_layer(x,global.water_y,"Above",obj_water_woosh_small);
	//instance_destroy(self);
}

part_type_direction(pt_laserlines, dir, dir, 0, 72);
part_emitter_region(ps_laserlines, pt_laserlines, x, x, y, y, 0, 1);
part_emitter_burst(ps_laserlines, pt_laserlines, pt_laserlines, 9);