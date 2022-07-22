/// @description Insert description here
// You can write your code in this editor

image_speed=0;
image_index=irandom(image_number-1);

image_blend = global.colour;
image_alpha = random_range(0.7,0.8);

direction=choose(180,0);
speed=choose(0.1,0.08,0.05);

xx[0]=0;
yy[0]=0;

for (i=0; i<6; i++)
{
	xx[i] = x + irandom_range(-256,256);
	yy[i] = y + irandom_range(-96,96);
}

alarm[0]=15*room_speed;