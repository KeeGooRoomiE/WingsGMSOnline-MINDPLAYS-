/// @description Insert description here
// You can write your code in this editor
//x = global.target_x;
//y = global.target_y;

if (instance_exists(plane))
{
	//var pd = point_direction(plane.x,plane.y,plane.x + lengthdir_x(64, pd),mouse_y);
	x = plane.x + lengthdir_x(64, plane.direction);
	y = plane.y + lengthdir_y(64, plane.direction);

	image_angle = plane.direction;//point_direction(x,y,mouse_x,mouse_y);
}
else
{
	visible = false;
}