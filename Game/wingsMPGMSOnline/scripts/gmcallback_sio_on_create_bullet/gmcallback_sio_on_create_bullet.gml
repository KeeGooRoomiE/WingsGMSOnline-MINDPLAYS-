function gmcallback_sio_on_create_bullet() {
	var data = json_decode(argument[0]);
	
	with(instance_create_layer(data[? "x"],data[? "y"],"Active",obj_mg_bullet)) 
	{
		ownerId = data[? "owner"];
		direction = data[? "direction"];
		speed = data[? "speed"];
		bulletId = data[? "bulletId"];
		//alarm[0]=5*room_speed;
		
		//bullet = instance_create_layer(bx,by,"Active",obj_mg_bullet);
		//bullet.direction = direction;
		//bullet.spd = 24;
		show_debug_message("//FLYENGINE: bullet w/ bulletId:"+string(bulletId)+" created;");
	}


}
