function gmcallback_sio_on_create_bonus() {
	var data = json_decode(argument[0]);
	
	with(instance_create_layer(data[? "x"],data[? "y"],"Active",obj_game_bonus)) 
	{
		bonusId = data[? "bonusId"];
		//alarm[0]=5*room_speed;
		
		//bullet = instance_create_layer(bx,by,"Active",obj_mg_bullet);
		//bullet.direction = direction;
		//bullet.spd = 24;
		show_debug_message("//FLYENGINE: client bonus w/ bulletId:"+string(bonusId)+" created;");
	}


}
