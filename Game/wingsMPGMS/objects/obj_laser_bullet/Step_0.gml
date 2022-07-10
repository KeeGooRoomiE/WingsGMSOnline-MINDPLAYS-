/// @description Insert description here
// You can write your code in this editor

image_angle = direction;

if (y-4 >= global.water_y)
{
	instance_create_layer(x,global.water_y,"Above",obj_water_woosh_small);
	instance_destroy(self);
}