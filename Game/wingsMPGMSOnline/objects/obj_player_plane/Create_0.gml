/// @description Init
// You can write your code in this editor

image_blend = global.colour;

vertRot = 1;



spd = 5;
rotSpd = 0.05;
lastspd = 0;
accCD=3*room_speed;
//pierceLength = 64;

pointer_x = x;
pointer_y = y+1;



hp = 110;

isColoured = true;

weaponType = 2;
bulletReload = 6;
rocketReload = 75;
laserReload = 256;
punchReload = 2 * room_speed;

//navRocketAmmo = 3;
navRocketRecoil = 0.2*room_speed;

laserMaxAmmo = 255;
laserAmmo = laserMaxAmmo;
laserMaxLength = 1024;
laserLength = laserMaxLength;
laserBullet = noone;

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

alarm[11]=0.1*room_speed;

#region -- DEBUG Set random image

sprite_index = choose(spr_flyer_bobcat, spr_flyer_corn, spr_flyer_falcon, spr_flyer_sauce, spr_flyer_f12);

#endregion

folcam = noone;
pierce = noone;
angler = noone;
interest = noone;

//event_user(1);

show_debug_message("FLYENGINE: controllable plane created");
