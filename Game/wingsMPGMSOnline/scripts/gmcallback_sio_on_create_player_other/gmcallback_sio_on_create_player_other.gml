function gmcallback_sio_on_create_player_other() 
{
	show_debug_message("//Sio callback create_player_other");
	var data = json_decode(argument[0]);
	show_debug_message("//callback data got -- id:" +string( data[?"id"] ) +" username: "+string(data[? "username"])+" canShotMg:"+string(data[? "canShotMg"]));
	var xx = irandom(room_width);
	var yy = 600;

	with(instance_create_layer(xx, yy, "Active", obj_player_plane)) 
	{
		isLocalPlayer = false;
		playerId = data[? "id"];
		username = data[? "username"];
		canShotMg = data[? "canShotMg"];
		event_user(1);
	}
}
