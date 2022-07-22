/// @description Insert description here
// You can write your code in this editor


target_y = ystart + (8 * global.controller.hour);
image_alpha = 0.72 - global.controller.daytime * 0.48;


move_towards_point(x,target_y,spd);

if (point_distance(x,y,x,target_y) < spd*2)
{
	spd = 0;
} else {
	spd = 0.1;
}