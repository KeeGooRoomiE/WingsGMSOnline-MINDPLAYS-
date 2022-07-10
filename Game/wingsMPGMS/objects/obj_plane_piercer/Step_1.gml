/// @description Insert description here
// You can write your code in this editor
//x = global.target_x;
//y = global.target_y;

if (plane != noone)
{
	var pd = point_direction(plane.x,plane.y,mouse_x,mouse_y);
	x = plane.x + lengthdir_x(68, pd);
	y = plane.y + lengthdir_y(68, pd);

	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	visible = false;
}