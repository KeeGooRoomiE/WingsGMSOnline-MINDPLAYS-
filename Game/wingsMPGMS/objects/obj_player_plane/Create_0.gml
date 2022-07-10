/// @description Insert description here
// You can write your code in this editor

image_blend = global.colour;

vertRot = 1;

global.target_x = 0;
global.target_y = 0;

spd = 5;
rotSpd = 0.05;
lastspd = 0;
accCD=3*room_speed;
pierceLength = 64;

hp = 110;

isColoured = true;

weaponType = 1;
bulletReload = 6;
rocketReload = 75;
laserReload = 256;
punchReload = 2 * room_speed;

navRocketAmmo = 3;
navRocketRecoil = 0.2*room_speed;

laserMaxAmmo = 255;
laserAmmo = laserMaxAmmo;
laserMaxLength = 1024;
laserLength = laserMaxLength;

canShotMg = true;
canShotSp = true;
isLaserShooting = false;
isPunching = false;

punchAmmo = 0.75*room_speed;
punchB = noone;

isOut = false;
outCounter = 0;
planeOut = false;
canShowCounter=false;
counterScale = 1;
counterAlpha = 1;

alarm[2]=5*room_speed;
alarm[3]=10*room_speed;

folcam = instance_create_layer(x,y,"UI",obj_camera_follower);
folcam.target = id;

pierce = instance_create_layer(x,y,"UI",obj_plane_piercer);
pierce.plane = id;

angler = instance_create_layer(x,y,"UI",obj_plane_director);
angler.plane = id;


