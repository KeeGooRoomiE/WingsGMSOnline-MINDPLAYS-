/// sio_init()
function sio_init() {
	gml_pragma("global", "sio_init()");

show_debug_message("//socket.io init");
#region macros
	#macro URL "http://194.110.55.61:3001" 
	//#macro URL "localhost:3001"
#endregion

#region SocketIO
		sio_connect_by_url(URL);
		show_debug_message("socket.io url set...");
#endregion

#region SocketIO:Events
		sio_addEvent("create_player");
		sio_addEvent("create_bullet");
		sio_addEvent("create_player_other");
		sio_addEvent("destroy_player");
		sio_addEvent("destroy_bullet");
		sio_addEvent("position_update");
		sio_addEvent("create_bonus");
		sio_addEvent("destroy_bonus");
		sio_addEvent("hp_update");
		sio_addEvent("pong");
		show_debug_message("//socket.io events loaded...");
#endregion


}
