function gmcallback_sio_on_destroy_bullet() {

	var data = json_decode(argument[0]);

	with(obj_mg_bullet){
		if(real(bulletId) == real(data[? "bulletId"])){
			instance_destroy();
			show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" destroyed;");
			break;
		}
	}


}
