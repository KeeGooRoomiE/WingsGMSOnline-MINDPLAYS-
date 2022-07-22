/// @description Insert description here
// You can write your code in this editor

#region -- Smooth rotation

var _dir = point_direction(x, y, target_x, target_y);
var _diff = angle_difference(_dir, direction);
direction += _diff * rotSpd;

image_angle = direction;

#endregion

#region -- Set plane speed

speed = spd;

/*
if (player != noone)
{
	if point_distance(x, y, player.x, player.y) > 1024
	{
		spd = 3.5;
	}
	
	if point_distance(x, y, player.x, player.y) < 512
	{
		spd = 2.5;
	}
}
*/

#endregion

#region -- Checking Z rotation value

if ( in_range(direction,0,90)  )
{
	var ad = angle_difference(0,direction);
	//show_debug_message( string( ad/(-90) ) );
	vertRot = ad/(-90);
	
}

if ( in_range(direction,270,359)  )
{
	var ad = angle_difference(0,direction);
	//show_debug_message( string( ad/90 ) );
	vertRot = ad/90;
	
}

if ( in_range(direction,91,180)  )
{
	var ad = angle_difference(180,direction);
	//show_debug_message( string( ad/90 ) );
	vertRot = ad/90;
	
}

if ( in_range(direction,181,270)  )
{
	var ad = angle_difference(180,direction);
	//show_debug_message( string( ad/(-90) ) );
	vertRot = ad/(-90);
	
}

#endregion

#region -- Find player and angle

if (retakePosition)
{
	player_angle = irandom(360);
	radius = choose(256,320,384,640);
	retakePosition = false;
}

if (interceptPosition)
{
	player_angle = irandom(360);
	radius = choose(128,96,144);
	interceptPosition = false;
}

player = instance_nearest(x,y,obj_player_plane);

if (player != noone)
{
	target_x = player.x + lengthdir_x(radius,player_angle);
	target_y = player.y + lengthdir_y(radius,player_angle);
}

#endregion

#region -- Move camera interest

int.x = x;
int.y = y;

#endregion

#region -- Hp left behaviour

if (hp <75)
{
	part_emitter_region(ps_smoke_puff, pe_smoke_puff, x, x, y, y, 0, 1);
	part_type_direction(pt_smoke_puff, direction-5, direction+5, 0, 22);
	part_emitter_burst(ps_smoke_puff, pe_smoke_puff, pt_smoke_puff, 9);
}

if (hp < 40)
{
	part_emitter_region(ps_smoke_puff, pe_smoke_puff, x, x, y, y, 0, 1);
	part_type_direction(pt_smoke_puff, direction-5, direction+5, 0, 22);
	part_emitter_burst(ps_smoke_puff, pe_smoke_puff, pt_smoke_puff, 2);
	part_emitter_burst(ps_explosion, pe_explosion, pt_explosion, -12);
	part_emitter_region(ps_explosion, pe_explosion, x, x, y, y, 0, 1);
}

if (hp <= 0)
{
	part_emitter_region(ps_lblast, pe_lblast, x, x, y, y, 0, 1);
	part_emitter_burst(ps_lblast, pe_lblast, pt_lblast, 7);
	instance_destroy(int);
	instance_destroy(self);
	write_console("Nesterov AI plane was destroyed");
}

#endregion

#region -- Water collide effect

if (y >= global.water_y)
{
	hp -=4;
}

#endregion

#region -- Shooting MG to player

player = instance_nearest(x,y,obj_player_plane);

if (player != noone)
{
	var plane_to_player_angle = point_direction(x,y,player.x,player.y);
	
	if (point_distance(x,y,player.x,player.y) <= triggerRange)
	{
		if (abs(angle_difference(plane_to_player_angle,direction))<=angle_damping)
		{
			if (canShotMg = true)
			{
				canShotMg = false;
				alarm[1]=bulletReload;
	
				var dirdamp = irandom_range(-5,5);
				var bx = x + lengthdir_x(24,direction+dirdamp);
				var by = y + lengthdir_y(24,direction+dirdamp);
	
				bullet = instance_create_layer(bx,by,"Active",obj_mg_bullet_other);
				bullet.direction = direction;
				bullet.spd = 24;
				
				part_emitter_region(ps_mg_muzzle, pe_mg_muzzle, bx, bx, by, by, 0, 1);
				part_type_direction(pt_mg_muzzle, direction, direction, 0, 0);
				part_type_orientation(pt_mg_muzzle, direction, direction, 0, 0, 0);
				part_emitter_burst(ps_mg_muzzle, pe_mg_muzzle, pt_mg_muzzle, 1);
				
				var _revdir = point_direction(x,y,x - lengthdir_x(1,direction), y - lengthdir_y(1,direction));
				part_emitter_region(ps_mg_casing, pe_mg_casing, x, x, y, y, 0, 1);
				part_type_orientation(pt_mg_casing, 0, 359, 0, 0, 1);
				part_type_direction(pt_mg_casing, _revdir, _revdir, 0, 12);
				part_emitter_burst(ps_mg_casing, pe_mg_casing, pt_mg_casing, 1);
			}
		}
	}
}

#endregion