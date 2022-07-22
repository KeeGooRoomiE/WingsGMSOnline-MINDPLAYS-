/// @description DEBUG Fake unload other plane

show_debug_message("//Sio callback create_player_other");

	var xx = irandom(room_width);
	var yy = 600;
	var idd = irandom(10);
	var usernamee = "P" + string(irandom(99));
	var csm = true;
	
show_debug_message("//SIO: %username% id:" +string( idd ) +" username: "+string(usernamee)+" canShotMg:"+string(csm));


	with(instance_create_layer(xx, yy, "Active", obj_player_plane)) 
	{
		isLocalPlayer = false;
		playerId = idd;
		username = usernamee;
		canShotMg = csm;
		event_user(1);
	}

show_debug_message("//FLYENGINE: %USERNAME%:"+string(usernamee)+" plane entered the field");
write_console("Player P" +string(irandom(100))+ " plane entered the field");