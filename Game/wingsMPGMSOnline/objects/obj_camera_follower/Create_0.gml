/// @description Start values

show_debug_message("// Camera follower init");
target = noone;
camDist = 360;
interestDist = 320;

curZoomLevelW = 0;
curZoomLevelH = 0;
maxZoomLevelW = 640;
maxZoomLevelH = 360;


CamWPort = 1280;
CamHPort = 720;

isInterest = false;
i = 0;
endcam = instance_create_layer(x,y,"Instances",obj_camera_target);
endcam.target = id;

//camera_set_view_target(view_camera[0], id);