/// @description Insert description here
// You can write your code in this editor

image_angle = direction;
speed = spd;
spd -= spd_step;


if (spd < 10)
{
	//var ad = angle_difference(270,direction);
	//direction += ad*0.01;
	spd_step += 0.005;
}


if ( spd<1)
{
	instance_destroy(self);
	wEffect = false;
}

if (y-4 >= global.water_y)
{
	instance_create_layer(x,global.water_y,"Above",obj_water_woosh_small);
	instance_destroy(self);
}