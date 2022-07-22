function gmcallback_sio_on_connect() {
	show_debug_message("connected to server!");
	show_debug_message("//socket.io connected");
	sio_emit_create_player();
	global.GotServerResponse = true;

}
