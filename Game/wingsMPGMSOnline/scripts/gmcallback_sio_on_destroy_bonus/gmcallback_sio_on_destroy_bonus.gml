function gmcallback_sio_on_destroy_bonus() {

	var data = json_decode(argument[0]);

	with(obj_game_bonus){
		if(real(bonusId) == real(data[? "id"])){
			instance_destroy();
			break;
		}
	}


}
