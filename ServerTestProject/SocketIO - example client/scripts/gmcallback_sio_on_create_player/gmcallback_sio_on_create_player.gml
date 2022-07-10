function gmcallback_sio_on_create_player() {
	var data = json_decode(argument[0]);

	show_debug_message("//socket.io player creation event callback...");
	with(instance_create_depth(data[? "x"], data[? "y"], 0, oPlayer)) {
		isLocalPlayer = true;
	
		playerId = data[? "id"];
		username = data[? "username"];
		canShot = data[? "canShot"];
		
		global.localPl = id;
		show_debug_message("//socket.io player creation event set values...");
	}


}
