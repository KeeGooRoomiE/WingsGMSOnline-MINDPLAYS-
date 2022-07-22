/// sio_emit_destroy_bullet()
/// @descr Send bullet destroy packet to the server
function sio_emit_destroy_bullet(type) {
	var eventName = "destroy_bullet";

	//show_debug_message("//SIO: client bullet deletion event...");
#region packet
		var data = ds_map_create();
			data[? "bulletId"] = bulletId;;
			data[? "deathType"] = type;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion

//instance_destroy(self);
}
