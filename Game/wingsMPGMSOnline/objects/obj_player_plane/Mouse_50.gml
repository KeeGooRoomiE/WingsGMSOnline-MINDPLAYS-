/// @description Mg Shot
// You can write your code in this editor

if (isLocalPlayer)
{
	if (canShotMg)
	{
		canShotMg = false;
	
		alarm[0]=bulletReload;
	
		var dirdamp = irandom_range(-5,5);
		var bx = x + lengthdir_x(24,direction+dirdamp);
		var by = y+ lengthdir_y(24,direction+dirdamp);
	
		sio_emit_create_bullet(playerId,24,direction,bx,by);
		
		part_emitter_region(ps_mg_muzzle, pe_mg_muzzle, bx, bx, by, by, 0, 1);
		part_type_direction(pt_mg_muzzle, direction, direction, 0, 0);
		part_type_orientation(pt_mg_muzzle, direction, direction, 0, 0, 0);
		part_emitter_burst(ps_mg_muzzle, pe_mg_muzzle, pt_mg_muzzle, 1);
		
		var _revdir = point_direction(x,y,x - lengthdir_x(1,direction), y - lengthdir_y(1,direction));
		part_emitter_region(ps_mg_casing, pe_mg_casing, x, x, y, y, 0, 1);
		part_type_orientation(pt_mg_casing, 0, 359, 0, 0, 1);
		part_type_direction(pt_mg_casing, _revdir, _revdir, 0, 12);
		part_emitter_burst(ps_mg_casing, pe_mg_casing, pt_mg_casing, 1);

		
		
		
		bullet = instance_create_layer(bx,by,"Active",obj_mg_bullet);
		bullet.direction = direction;
		bullet.spd = 24;
		bullet.ownerId = playerId;

	}
}