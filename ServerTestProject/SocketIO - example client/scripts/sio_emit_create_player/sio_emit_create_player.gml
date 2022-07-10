/// sio_emit_create_player()
/// @descr Send player creation packet to the server
function sio_emit_create_player() {

	show_debug_message("//socket.io player creation event...");
	var eventName = "create_player";
	var username = "P" + string(irandom(99));
	show_debug_message("//socket.io player set username...");
#region packet
		var data = ds_map_create();
			data[? "username"] = username;
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion

show_debug_message("//socket.io player connected...");
}
