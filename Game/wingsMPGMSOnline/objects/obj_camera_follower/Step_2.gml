/// @description Camera movement

#region -- Interest focus && camera allign
if instance_exists(obj_player_plane)
{
    
	if instance_exists(obj_camera_interest)
	{
		i = instance_nearest(obj_player_plane.x,obj_player_plane.y,obj_camera_interest);
		
		if ( point_distance(obj_player_plane.x,obj_player_plane.y,i.x,i.y) < interestDist)
		{
			x = i.x;
			y = i.y;
			isInterest = true;
		}
		else
		{
	    //obj_player_plane.y;
	
		//var dir = point_direction(obj_player_plane.x,obj_player_plane.y,mouse_x,mouse_y);
		x = obj_player_plane.x + lengthdir_x(camDist,obj_player_plane.direction);
		y = obj_player_plane.y + lengthdir_y(camDist,obj_player_plane.direction);
	
		isInterest = false;
	
		camDist = obj_player_plane.spd*96;
		}
	}
	else
	{
	x = obj_player_plane.x + lengthdir_x(camDist,obj_player_plane.direction);
	y = obj_player_plane.y + lengthdir_y(camDist,obj_player_plane.direction);
	
	isInterest = false;
	
	camDist = obj_player_plane.spd*96;
	}
	
}
else
{
    x=xprevious;
    y=yprevious;
}
#endregion

#region -- Zoom camera
camera_set_view_size(view_camera[0],CamWPort+curZoomLevelW,CamHPort+curZoomLevelH);
camera_set_view_border(view_camera[0],CamWPort/2+curZoomLevelW/2,CamHPort/2+curZoomLevelH/2);
#endregion

#region -- Zooming change
if (isInterest)
{
	//WIDTH
	if (curZoomLevelW < maxZoomLevelW)
	{
		curZoomLevelW+=32;
	}
	else
	{
		curZoomLevelW = maxZoomLevelW;
	}
	
	//HEIGHT
	if (curZoomLevelH < maxZoomLevelH)
	{
		curZoomLevelH+=18;
	}
	else
	{
		curZoomLevelH = maxZoomLevelH;
	}
}
else
{	
	//WIDTH
	if (curZoomLevelW > 0)
	{
		curZoomLevelW-=32;
	}
	else
	{
		curZoomLevelW = 0;
	}
	
	//HEIGHT
	if (curZoomLevelH > 0)
	{
		curZoomLevelH-=18;
	}
	else
	{
		curZoomLevelH = 0;
	}
}
#endregion
