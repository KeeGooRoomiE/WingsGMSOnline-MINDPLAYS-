function sio_emit_bullet_update() {
	var eventName = "bullet_update";

#region packet
		var data = ds_map_create();
			data[? "bulletId"] = bulletId;;
			
			data[? "direction"] = direction;
			//data[? "speed"] = speed;
			//data[? "x"] = x + lengthdir_x(speed,direction);
			//data[? "y"] = y + lengthdir_y(speed,direction);
			data[? "x"] = x;
			data[? "y"] = y;
			
			sio_emit(eventName, json_encode(data));
		ds_map_destroy(data);
#endregion
show_debug_message("//socket.io bullet position update event...");
show_debug_message("//socket.io emit bullet_update(id:"+string(id)+",x:"+string(x)+",y:"+string(y)+"direction:"+string(direction) );

}
