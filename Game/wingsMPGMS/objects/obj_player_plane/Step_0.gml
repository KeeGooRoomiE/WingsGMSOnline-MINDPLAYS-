/// @description Behvaiour
// You can write your code in this editor

#region -- Smooth rotation

var _dir = point_direction(x, y, mouse_x, mouse_y);
var _diff = angle_difference(_dir, direction);
direction += _diff * rotSpd;

image_angle = direction;

#endregion

global.target_x = x;//x+lengthdir_x(pierceLength,ad);
global.target_y = y;//y+lengthdir_y(pierceLength,ad);

#region -- Set plane speed

speed = spd;

/*if point_distance(x, y, mouse_x, mouse_y) > spd
{
    speed = spd;
}
else
{
	spd = 0;
}*/


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

if (accCD > 0)
{
	accCD -= 1;
}

//spd = max(1.5,(point_distance(x,y,mouse_x,mouse_y) / 64));

if (spd > lastspd)
{
	if (accCD < 1)
	{
		event_user(0);
		accCD=3*room_speed;
	}
}

if (y <= global.space_y)
{
	isOut = true;
	//show_debug_message("Plane is zone of out");
}else
{
	isOut = false;
}

if (planeOut)
{
	show_message("You left the game");
	room_restart();
}


#region -- Hp left behaviour

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
	part_emitter_burst(ps_lblast, pe_lblast, pt_lblast, 1);
	//show_message("No HP left. No worries, there are your meds...");
	x = irandom(room_width);
	y = 600;
	hp=110;
	show_debug_message("//YEAH< U DIED, MAN");
}
#endregion

#region -- Laser reload

if (isLaserShooting = false)
{
	show_debug_message("//LASER SP AMMO UPDATE: "+string(laserAmmo) );
	if (laserAmmo < laserMaxAmmo)
	{
		laserAmmo++;
	}
}

#endregion

#region -- Laser length

if (isLaserShooting = true)
{
	var line = collision_line(x,y,x+lengthdir_x(laserLength,direction),y+lengthdir_y(laserLength,direction),obj_dummy_plane,0,1);
	
	if ( line != noone )
	{
		show_debug_message("//SOMEONE FOUND UNDER THE LINE. SHORTING THE LINE...");
		laserLength = point_distance(x,y,line.x,line.y)-32;
		show_debug_message("//NEW LASER LENGTH: "+string(laserLength));
		
		var l = instance_create_layer(line.x,line.y,"Active",obj_laser_bullet);
		l.direction = direction;
		l.speed = 3;
		
	} 
	else 
	{
		if (laserLength < laserMaxLength) 
		{
			show_debug_message("//LASER LINE REBUILD...");
			laserLength = laserMaxLength;
		}
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
			punchB = instance_create_depth(x + lengthdir_x(32,direction),y + lengthdir_y(32,direction),depth+1,obj_punch_bullet);
		} else 
		{
			//punchB.creator = id;
			punchB.x = x + lengthdir_x(32,direction);
			punchB.y = y + lengthdir_y(32,direction);
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
