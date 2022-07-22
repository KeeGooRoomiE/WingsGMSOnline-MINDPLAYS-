function gmcallback_sio_on_destroy_player() {

	var data = json_decode(argument[0]);

	with(obj_player_plane){
		if(real(playerId) == real(data[? "id"])){
			instance_destroy();
			break;
		}
	}


}
