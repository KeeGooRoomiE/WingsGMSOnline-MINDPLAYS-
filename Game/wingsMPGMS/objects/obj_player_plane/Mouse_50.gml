/// @description Mg Shot
// You can write your code in this editor

if (canShotMg)
{
	canShotMg = false;
	
	alarm[0]=bulletReload;
	
	var dirdamp = irandom_range(-5,5);
	var bx = x + lengthdir_x(24,direction+dirdamp);
	var by = y+ lengthdir_y(24,direction+dirdamp);
	
	bullet = instance_create_layer(bx,by,"Active",obj_mg_bullet);
	bullet.direction = direction;
	bullet.spd = 24;
	

}