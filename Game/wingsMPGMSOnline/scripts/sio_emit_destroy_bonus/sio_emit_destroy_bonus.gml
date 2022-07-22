/// sio_emit_destroy_bonus()
/// @descr Send bonus destroy packet to the server
function sio_emit_destroy_bonus() {
	var eventName = "destroy_bonus";

	show_debug_message("//SIO: client bonus deletion event...");
#region packet
		var data = ds_map_create();
			data[? "bonusId"] = bonusId;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion

//instance_destroy(self);
}
