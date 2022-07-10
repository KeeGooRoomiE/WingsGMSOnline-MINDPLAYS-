function gmcallback_sio_on_create_bullet() {
	var data = json_decode(argument[0]);
	
	with(instance_create_depth(data[? "x"], data[? "y"], 0, obj_bullet)) 
	{
		ownerId = data[? "owner"];
		direction = data[? "direction"];
		speed = data[? "speed"];
		bulletId = data[? "bulletId"];
		alarm[0]=5*room_speed;
		
		show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" created;");
	}


}
