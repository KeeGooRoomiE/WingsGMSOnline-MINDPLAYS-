function gmcallback_sio_on_hp_update() {
	var data = json_decode(argument[0]);

	show_debug_message("//socket.io player update values callback event...");
	with(obj_player_plane){
		if(real(playerId) == real(data[? "id"])){
			if(!isLocalPlayer) {
				hp = data[? "hp"];
			}
		}
	}


}
