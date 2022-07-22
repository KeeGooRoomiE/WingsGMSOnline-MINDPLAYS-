/// @description Behaviour
// You can write your code in this editor


speed = curspd;

if (isPierced)
{
	gravity = 0;
	image_angle = direction;
	curspd = spd;
	
	if (isLoaded = false)
	{
		isLoaded = true;
		alarm[1]=1.4*room_speed;
		part_emitter_region(ps_explosion, pe_explosion, x, x, y, y, 0, 1);
		part_type_direction(pt_explosion, dir-5, dir+5, 0, 22);
		part_emitter_burst(ps_explosion, pe_explosion, pt_explosion, 3);
	}
	
	if (isTargetSet = false)
	{
		target = instance_nearest(x,y,obj_dummy_plane);
		if (target != noone)
		{
			direction = point_direction(x,y,target.x,target.y);
		}
		isTargetSet = true;
	}
	
	part_emitter_region(tinypuff_ps, tinypuff_pe, x, x, y, y, 0, 1);
	part_emitter_burst(tinypuff_ps, tinypuff_pe, tinypuff_pt, 2);
}
else
{
	curspd = 0;
	image_angle = dir;
}

if (y-4 >= global.water_y)
{
	instance_create_layer(x,global.water_y,"Above",obj_water_woosh_small);
	instance_destroy(self);
}