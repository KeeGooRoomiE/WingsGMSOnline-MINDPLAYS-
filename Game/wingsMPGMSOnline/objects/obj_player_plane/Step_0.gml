/// @description Behvaiour
// Most of the behaviour set there

#region -- Local rotate update

if (isLocalPlayer)
{
	pointer_x = mouse_x;
	pointer_y = mouse_y;
}

#endregion

#region -- Smooth rotation

var _dir = point_direction(x, y, pointer_x, pointer_y);
var _diff = angle_difference(_dir, direction);
direction += _diff * rotSpd;

image_angle = direction;

#endregion

#region -- Move camera interest

if (!isLocalPlayer)
{
	if (!instance_exists(interest) )
	{
		interest = instance_create_layer(x,y,"UI",obj_camera_interest);
		interest.plane = id;
	}
	else
	{
		interest.x = x;
		interest.y = y;
	}
}

#endregion

#region -- Set plane speed

speed = spd;

#endregion

#region -- Local target AI update [NEEDTOFIX]

global.target_x = x;//x+lengthdir_x(pierceLength,ad);
global.target_y = y;//y+lengthdir_y(pierceLength,ad);

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

if (isColoured)
{
	//image_yscale = 1-vertRot;
	
	if ( in_range(direction,91,269) )
	{
		image_yscale = -1+vertRot;
	}
	else
	{
		image_yscale = 1-vertRot;
	}
} else
{
	if ( in_range(direction,91,269) )
	{
		image_yscale = -1;
	}
	else
	{
		image_yscale = 1;
	}
}

#endregion

#region -- Rotate effect

if (abs(_diff)) > 75
{
		var s = instance_create_depth(x,y,depth-1,obj_spdeff);
		s.image_angle = direction;
		s.direction = direction;
		s.speed = spd/10;
}

#endregion

#region -- OUT Zone reaction

if (y <= global.space_y)
{
	isOut = true;
}else
{
	isOut = false;
}

if (planeOut)
{
	show_message("You left the game");
	//room_restart();
	
	//need to destroy player and show score
}

#endregion

#region -- Hp left behaviour

if (y < global.water_y)
{
	if (hp <75)
	{
		part_emitter_region(ps_smoke_puff, pe_smoke_puff, x, x, y, y, 0, 1);
		part_type_direction(pt_smoke_puff, direction-5, direction+5, 0, 22);
		part_emitter_burst(ps_smoke_puff, pe_smoke_puff, pt_smoke_puff, 9);
	}

	if (hp < 40)
	{
		part_emitter_burst(ps_explosion, pe_explosion, pt_explosion, -12);
		part_emitter_region(ps_explosion, pe_explosion, x, x, y, y, 0, 1);
	}

	if (hp <= 0)
	{
		part_emitter_region(ps_lblast, pe_lblast, x, x, y, y, 0, 1);
		part_emitter_burst(ps_lblast, pe_lblast, pt_lblast, 6);
		//show_message("No HP left. No worries, there are your meds...");
		visible = 0;
		speed = 0;
		
		instance_destroy(self);
	}
}
#endregion

#region -- Laser reload

if (isLaserShooting = false)
{
	//show_debug_message("//LASER SP AMMO UPDATE: "+string(laserAmmo) );
	if (laserAmmo < laserMaxAmmo)
	{
		laserAmmo++;
	}
}

#endregion

#region -- Laser length

if (isLaserShooting = true)
{
	var line = collision_line(x,y,x+lengthdir_x(laserLength,direction),y+lengthdir_y(laserLength,direction),obj_dummy_plane,1,1);
	
	if (laserBullet = noone)
	{
		laserBullet = instance_create_layer(x,y,"Active",obj_laser_bullet);
	}
	else
	{
		if (instance_exists(laserBullet))
		{
			laserBullet.x = x + lengthdir_x(laserLength,direction);
			laserBullet.y = y + lengthdir_y(laserLength, direction);
		} 
		else 
		{
			laserBullet = noone
		}
	}
	if ( line != noone )
	{
		laserLength = point_distance(x,y,line.x,line.y)-32;	
	} 
	else 
	{
		if (laserLength < laserMaxLength) 
		{
			//show_debug_message("//LASER LINE REBUILD...");
			laserLength = laserMaxLength;
		}
	}
}
else
{
	if (instance_exists(laserBullet))
	{
		instance_destroy(laserBullet);
		laserBullet = noone;
	}
}

#endregion

#region -- Punch speed boost

if (isPunching = true)
{
	speed = spd*3;
	if (punchAmmo > 0)
	{
		punchAmmo--;
		if (punchB = noone)
		{
			punchB = instance_create_depth(x + lengthdir_x(36,direction),y + lengthdir_y(36,direction),depth+1,obj_punch_bullet);
		} else 
		{
			//punchB.creator = id;
			punchB.x = x + lengthdir_x(36,direction);
			punchB.y = y + lengthdir_y(36,direction);
		}
	} else 
	{
		isPunching = false;
		
	}
} else 
{
	speed = spd;
	instance_destroy(punchB);
	punchB = noone;
}

#endregion 


