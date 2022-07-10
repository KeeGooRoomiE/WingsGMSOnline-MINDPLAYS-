/// @description SP Shot
// You can write your code in this editor

//AIMED MISSLE
if (weaponType = 0)
{
	if (canShotSp)
	{

		alarm[1]=rocketReload;
		var dirdamp = irandom_range(-5,5);
		var bx = x + lengthdir_x(24,direction+dirdamp);
		var by = y+ lengthdir_y(24,direction+dirdamp);
		for (i=0; i<navRocketAmmo; i++)
		{
			bullet = instance_create_layer(bx,by,"Active",obj_rocket);
			bullet.direction = direction;
			bullet.dir = direction;
			bullet.spd = 9;
			bullet.shooter = id;
			bullet.alarm[0] = ((i*0.2)+0.5) *room_speed;
		}
		canShotSp = false;
	}
}

//ROCKET LINE
if (weaponType = 1)
{
	if (canShotSp)
	{
		canShotSp = false;
	
		alarm[1]=rocketReload;
		
		var bx = x + lengthdir_x(24,direction);
		var by = y + lengthdir_y(24,direction);
		var rocketCount = 0;
		var MaxRocketCount = 3;
		var angleCap = 5;
		
		for (rocketCount=0; rocketCount<MaxRocketCount; rocketCount++) 
		{
		    bullet = instance_create_layer(bx,by,"Active",obj_lined_rocket);
			bullet.direction = direction+irandom_range(-5,5);
			bullet.dir = direction+irandom_range(-5,5);
			bullet.pdir = direction-angleCap+(angleCap*rocketCount);
			bullet.spd = 10;
			bullet.shooter = id;
		}
	}
}

//LASER
if (weaponType = 2)
{
	if (canShotSp)
	{
		if (laserAmmo > 0)
		{
			laserAmmo--;
			isLaserShooting = true;
			
			show_debug_message("//LASER SP AMMO: "+string(laserAmmo) );
			
			
			var bx = x + lengthdir_x(24,direction);
			var by = y + lengthdir_y(24,direction);
		
			/*bullet = instance_create_layer(bx,by,"Active",obj_laser_bullet);
			bullet.direction = direction;
			bullet.spd = 20;
			bullet.shooter = id;
			*/
		}
		else
		{
			canShotSp = false;
			alarm[1]=laserReload;
			isLaserShooting = false;
		}
	} else {
		isLaserShooting = false;
	}
}

//ONE PUNCH MAN
if (weaponType = 3) 
{
	if (canShotSp)
	{
		isPunching = true;
		canShotSp = false;
		alarm[1]=punchReload;
	}
}