function sio_emit_hp_update() {
	var eventName = "hp_update";

#region packet
		var data = ds_map_create();
			data[? "hp"] = hp;
			data[? "id"] = id;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
//show_debug_message("//SIO: player HP update event...");

}
