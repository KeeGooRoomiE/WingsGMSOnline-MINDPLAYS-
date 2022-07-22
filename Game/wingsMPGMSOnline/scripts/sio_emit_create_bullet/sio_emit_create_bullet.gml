/// sio_emit_create_bullet()
/// @descr Send bullet creation packet to the server
function sio_emit_create_bullet(owner,speed,direction,x,y) {
	var eventName = "create_bullet";

	//show_debug_message("//SIO: bullet creation event...");
#region packet
		var data = ds_map_create();
			data[? "owner"] = owner;
			data[? "x"] = x;
			data[? "y"] = y;
			data[? "direction"] = direction;
			data[? "speed"] = speed;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
}
