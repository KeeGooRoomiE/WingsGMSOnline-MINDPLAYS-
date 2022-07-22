/// @description Set camera reactions

if (isLocalPlayer)
{
	folcam = instance_create_layer(x,y,"UI",obj_camera_follower);
	folcam.target = id;

	pierce = instance_create_layer(x,y,"UI",obj_plane_piercer);
	pierce.plane = id;

	angler = instance_create_layer(x,y,"UI",obj_plane_director);
	angler.plane = id;
	show_debug_message("FLYENGINE: player camera setup: +f +p +d -i");
} else
{
	interest = instance_create_layer(x,y,"UI",obj_camera_interest);
	interest.plane = id;
	show_debug_message("FLYENGINE: player camera setup:  -f -p -d +i");
}



