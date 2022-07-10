/// @description Water woosh checking
// You can write your code in this editor

alarm[2]=0.2*room_speed;

/*point_in_rectangle(x,y,0,global.water_y-32,room_width,global.water_y)
{
	instance_create_layer(x,global.water_y,"Above",obj_water_woosh);
}
*/

if (( (y+2) < global.water_y) && ( (y+8+32) > global.water_y))
{
	instance_create_layer(x,global.water_y,"Above",obj_water_woosh);	
}