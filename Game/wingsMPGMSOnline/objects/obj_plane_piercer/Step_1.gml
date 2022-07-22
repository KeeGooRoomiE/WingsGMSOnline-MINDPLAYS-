/// @description Insert description here
// You can write your code in this editor
//x = global.target_x;
//y = global.target_y;

if (instance_exists(plane))
{
	var pd = point_direction(plane.x,plane.y,mouse_x,mouse_y);
	x = plane.x + lengthdir_x(72, pd);
	y = plane.y + lengthdir_y(72, pd);

	image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	visible = false;
}