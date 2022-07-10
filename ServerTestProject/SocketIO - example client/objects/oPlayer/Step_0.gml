/// Move player to mouse
if(isLocalPlayer){
//	x = mouse_x;
//	y = mouse_y;

	var _dir = point_direction(x, y, mouse_x, mouse_y);
	var _diff = angle_difference(_dir, direction);
	direction += _diff * 0.1;
	
	speed = clamp(point_distance(x,y,mouse_x,mouse_y)/56,0,7);
	//Send our new position to the server
	if (speed > 0)
	{
		sio_emit_position_update();
	}
	
}


//image_angle = direction;