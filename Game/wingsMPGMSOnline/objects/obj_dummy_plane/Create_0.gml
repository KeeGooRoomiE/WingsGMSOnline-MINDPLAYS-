/// @description Init

//image_blend = c_red;

vertRot = 1;

//global.target_x = 0;
//global.target_y = 0;

spd = 5;//irandom_range(3,5);//3;
rotSpd = choose(0.02,0.025,0.05,0.08);
lastspd = 0;

sprite_index = choose(spr_flyer_heavy,spr_flyer_wide,spr_flyer_interceptor,spr_flyer_navy);
c = choose(c_red,c_blue,c_yellow,c_green);
image_blend = c;

int=instance_create_depth(x,y,depth,obj_camera_interest);
int.x = x;
int.y = y;

target_x = 0;
target_y = 0;

alarm[0]=3*room_speed;
alarm[2]=35*room_speed;

player = noone;
player_angle = 0;
radius = choose(128,256,320,384);
angle_damping = 4;

bulletReload = 6;
canShotMg=true;
triggerRange = choose(320,360);

hp = 110;

retakePosition = false;
retakeSecs = choose(8,16);
interceptPosition = true;
interceptSecs = choose(12,21,27);

write_console("Nesterov AI plane entered the field");