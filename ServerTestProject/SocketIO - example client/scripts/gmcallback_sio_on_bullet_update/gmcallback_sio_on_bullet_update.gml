function gmcallback_sio_on_bullet_update() {
	var data = json_decode(argument[0]);

	show_debug_message("//socket.io bullet update values callback event...");
	with(obj_bullet){
		if (real(bulletId) == real(data[? "bulletId"]))
		{
			if (ownerId != global.localPl.playerId)
			{
				x = data[? "x"];
				y = data[? "y"];
				direction = data[? "direction"];
				//speed = data[? "speed"];
				err = data[? "error"];
				
				if (err = true)
				{
					sio_emit_destroy_bullet(1);
				}
				//speed = data[? "speed"];
				show_debug_message("//socket.io callback bullet_update(id:"+string( data[? "bulletId"] )+ ",x:"+string( data[? "x"] )+ ",y:"+string( data[? "y"] )+ ",direction:"+string( data[? "direction"] ) );
			}
		}
	}


}
