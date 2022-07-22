/// @description Bonus spawner
// You can write your code in this editor

alarm[2]= 6*room_speed;


#region -- Create bonus

if (bonusCount < maxBonusCount)
{
	var bx = irandom_range(0,room_width);
	var by = 0-32;
	
	bonus = instance_create_layer(bx,by,"Active",obj_game_bonus);
	//sio_emit_create_bonus();
	bonusCount++;
	
	show_debug_message("//FLYENGINE: bonus spawned");
}

#endregion



