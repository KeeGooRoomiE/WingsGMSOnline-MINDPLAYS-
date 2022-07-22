function gmcallback_sio_on_position_update() {
	var data = json_decode(argument[0]);
	
	with(obj_player_plane) 
	{
		if (real(playerId) == real(data[? "id"]))
		{
			if(!isLocalPlayer) 
			{
				x = data[? "x"];
				y = data[? "y"];
				direction = data[? "direction"];
				spd = data[? "spd"];
				canShotMg = data[? "canShotMg"];
			}
		}
	}


}
