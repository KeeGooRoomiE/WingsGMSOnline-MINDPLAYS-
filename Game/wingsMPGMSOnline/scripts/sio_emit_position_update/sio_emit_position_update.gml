function sio_emit_position_update() {
	var eventName = "position_update";

#region packet
		var data = ds_map_create();
			data[? "x"] = x;
			data[? "y"] = y;
			data[? "direction"] = direction;
			data[? "spd"] = spd;
			data[? "canShotMg"] = canShotMg;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
//show_debug_message("//SIO: callback position update event...");

}
