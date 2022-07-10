function gmcallback_sio_on_position_update() {
	var data = json_decode(argument[0]);

	show_debug_message("//socket.io player update values callback event...");
	with(oPlayer){
		if(real(playerId) == real(data[? "id"])){
			if(!isLocalPlayer) {
				x = data[? "x"];
				y = data[? "y"];
				direction = data[? "direction"];
				speed = data[? "speed"];
				canShot = data[? "canShot"];
			}
		}
	}


}
