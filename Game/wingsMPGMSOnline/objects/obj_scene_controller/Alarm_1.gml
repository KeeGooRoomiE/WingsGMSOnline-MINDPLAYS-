/// @description Server response error
// You can write your code in this editor

if (global.GotServerResponse = false)
{
	show_debug_message("//FLYENGINE: server response null. Turn game into local html setup.");
	
	global.isAIEnabled = true;
	global.isLocalStart = true;
	
	#region -- AI Spawner

if (global.isAIEnabled)
{
	alarm[0] = choose(15,18,21)*room_speed;
}

#endregion

	#region -- Local player creation

if (global.isLocalStart = true)
{
	var pl = instance_create_layer(irandom(room_width), 600, "Active", obj_player_plane);
	pl.isLocalPlayer = true;
	pl.playerId = 1;
	global.localPl = pl;
	with (pl)
	{	
		event_user(1);
	}
	show_debug_message("FLYENGINE: local plane player id:"+string(pl));
	repeat(12)
	{
		write_console("Player P" +string(irandom(100))+ " plane entered the field");
	}
}

#endregion
}


