/// @description Init settings
// You can write your code in this editor

show_debug_message("//FLYENGINE: init");

randomize();

#region -- BKG SETUP

#region --- BKG Gradient setup

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, global.colour);

#endregion

#region --- BKG Colour

depth = 800;

step = 1;

day_c1r = 50;
day_c1g = 69;
day_c1b = 110

day_c2r = 86;
day_c2g = 134;
day_c2b = 202;

day_c3r = 178;
day_c3g = 210;
day_c3b = 233;

night_c1r = 2;
night_c1g = 47;
night_c1b = 88;

night_c2r = 22;
night_c2g = 84;
night_c2b = 124;

night_c3r = 249;
night_c3g = 138;
night_c3b = 56;

//day_c1 = make_color_rgb(day_c1r, day_c1g, day_c1b);
//day_c2 = make_color_rgb(day_c2r, day_c2g, day_c2b);
//day_c3 = make_color_rgb(day_c3r, day_c3g, day_c3b);

//night_c1 = make_color_rgb(night_c1r, night_c1g, night_c1b);
//night_c2 = make_color_rgb(night_c2r, night_c2g, night_c2b);
//night_c3 = make_color_rgb(night_c3r, night_c3g, night_c3b);

cur_c1r = day_c1r;
cur_c1g = day_c1g;
cur_c1b = day_c1b;

cur_c2r = day_c2r;
cur_c2g = day_c2g;
cur_c2b = day_c2b;

cur_c3r = day_c3r;
cur_c3g = day_c3g;
cur_c3b = day_c3b;

cur_c1 = make_color_rgb(cur_c1r, cur_c1g, cur_c1b);
cur_c2 = make_color_rgb(cur_c2r, cur_c2g, cur_c2b);
cur_c3 = make_color_rgb(cur_c3r, cur_c3g, cur_c3b);

#endregion

#endregion

#region -- Time settings

//localtime = timezone_local;
//minutes = date_get_minute(date_current_datetime());
hour = date_get_hour(date_current_datetime());
daytime = true;

#endregion

#region -- Screen size array

show_debug_message("//FLYENGINE: available platform render sizes:");
sw[0] = 0;
sh[0] = 0;

//1280x720 100%
sw[100]=1280;
sh[100]=720;
show_debug_message("//FLYENGINE: 1280x720");

//960[540 75%
sw[75]=960;
sh[75]=540;
show_debug_message("//FLYENGINE: 960x540");

//860x480 65%
sw[65]=860;
sh[65]=480;
show_debug_message("//FLYENGINE: 860x480");

//640x360 50%
sw[50]=640;
sh[50]=360;
show_debug_message("//FLYENGINE: 640x360");

//512x288 40%
sw[40]=512;
sh[40]=288;show_debug_message("//FLYENGINE: 512x288");

canDecrRender = false;
canIncrRender = false;
fpsWaitTime = 30*room_speed;
curWaitTime = 0;

#endregion

#region -- SETTINGS

global.isAIEnabled = false;
global.SetFPSRate = 60;
global.renderSize = 100;
global.graphicsSet = 0;
global.dynamicRender = false;

ping = 0;

if os_browser == browser_not_a_browser
{
    game_set_speed(60, gamespeed_fps);
	global.SetFPSRate = 60;
	global.isLocalStart = true;
	show_debug_message("//FLYENGINE: compiled start.");
}
else
{
    game_set_speed(60, gamespeed_fps);
	global.SetFPSRate = 60;
	global.isLocalStart = false;
	show_debug_message("//FLYENGINE: html canvas start.");
}

if os_browser == browser_safari_mobile
{	
	global.renderSize = 65;
	
	view_set_wport(0,sw[global.renderSize]);
	view_set_hport(0,sh[global.renderSize]);
	//port(view_camera[0], cw, ch);
	view_set_camera(0,view_camera[0]);
	
	surface_resize(application_surface,sw[global.renderSize],sh[global.renderSize]);
	
	show_debug_message("//FLYENGINE: detected mobile. switch to 65% render");
}

global.water_y = 7534;
global.space_y = 400;
global.target_x = 0;
global.target_y = 0;
global.controller = id;
global.localPl = noone;
//global.isLocalStart = false;
global.GotServerResponse = false;

#endregion

#region -- AI Spawner

if (global.isAIEnabled)
{
	alarm[0] = choose(15,18,21)*room_speed;
}

#endregion

#region -- Local player creation

/*

if (global.isLocalStart = true)
{
	var pl = instance_create_layer(irandom(room_width), 600, "Active", obj_player_plane);
	pl.isLocalPlayer = true;
	pl.playerId = 1;
	global.localPl = pl;
	with (pl)
	{	
		event_user(1);
	}
	show_debug_message("//FLYENGINE: local plane player id:"+string(pl));
}

*/

#endregion

#region -- Local callback server response

alarm[1]=1*room_speed;

#endregion

#region -- Bonus handler

bonusCount = 0;
maxBonusCount = 12;

bonus = noone;

alarm[2]= 7*room_speed;

#endregion

#region -- PARTICLES

#region --- Explosion effect

globalvar ps_explosion; 
globalvar pt_explosion;
globalvar pe_explosion;
ps_explosion = part_system_create(); 
pt_explosion = part_type_create();
pe_explosion = part_emitter_create(ps_explosion);

//part_emitter_burst(ps_explosion, pe_explosion, pt_explosion, -12);
//part_emitter_stream(ps_explosion, pe_explosion, pt_explosion, -12);

//part_emitter_region(ps_explosion, pe_explosion, x, x, y, y, 0, 1);
part_type_direction(pt_explosion, -359, 359, 0, 22);

part_system_depth(ps_explosion, 0);
part_system_draw_order(ps_explosion, 1);
part_type_orientation(pt_explosion, 0, 359, 0, 0, 1);
part_type_speed(pt_explosion, 2, 2, 0, 0.40);
part_type_life(pt_explosion, 20, 40);
part_type_size(pt_explosion, 1, 1, 0, 0.40);
part_type_scale(pt_explosion, 1, 1);
part_type_gravity(pt_explosion, 0, 270);
part_type_blend(pt_explosion, 0);
part_type_sprite(pt_explosion, spr_effect_small_pyro, 1, 1, 0);
part_type_alpha1(ps_explosion, 1);
part_type_colour_rgb(ps_explosion, 255, 255, 255, 255, 255, 255);

#endregion

#region --- Large blast effect

globalvar ps_lblast; 
globalvar pt_lblast;
globalvar pe_lblast;
ps_lblast = part_system_create(); 
pt_lblast = part_type_create();
pe_lblast = part_emitter_create(ps_lblast);

//part_emitter_burst(ps_lblast, pe_lblast, pt_lblast, -12);
//part_emitter_stream(ps_lblast, pe_lblast, pt_lblast, -12);

//part_emitter_region(ps_lblast, pe_lblast, x, x, y, y, 0, 1);
part_type_direction(pt_lblast, -359, 359, 0, 22);

part_system_depth(ps_lblast, 0);
part_system_draw_order(ps_lblast, 1);
part_type_orientation(pt_lblast, 0, 359, 0, 0, 1);
part_type_speed(pt_lblast, 2, 2, 0, 0.20);
part_type_life(pt_lblast, 1*room_speed, 1*room_speed);
part_type_size(pt_lblast, 1, 1, 0, 0.1);
part_type_scale(pt_lblast, 1, 1);
part_type_gravity(pt_lblast, 0, 270);
part_type_blend(pt_lblast, 0);
part_type_sprite(pt_lblast, spr_effect_large_blast, 1, 1, 0);
part_type_alpha1(ps_lblast, 1);
part_type_colour_rgb(ps_lblast, 255, 255, 255, 255, 255, 255);

#endregion

#region --- Smoke puff effect

globalvar ps_smoke_puff; 
globalvar pt_smoke_puff;
globalvar pe_smoke_puff;
ps_smoke_puff = part_system_create(); 
pt_smoke_puff = part_type_create();
pe_smoke_puff = part_emitter_create(ps_smoke_puff);

//part_emitter_burst(ps_smoke_puff, pe_smoke_puff, pt_smoke_puff, -12);
//part_emitter_stream(ps_smoke_puff, pe_smoke_puff, pt_smoke_puff, -12);

//part_emitter_region(ps_smoke_puff, pe_smoke_puff, x, x, y, y, 0, 1);
part_type_direction(pt_smoke_puff, -359, 359, 0, 22);

part_system_depth(ps_smoke_puff, 0);
part_system_draw_order(ps_smoke_puff, 1);
part_type_orientation(pt_smoke_puff, 0, 359, 0, 0, 1);
part_type_speed(pt_smoke_puff, 2, 2, 0, 0.40);
part_type_life(pt_smoke_puff, 20, 40);
part_type_size(pt_smoke_puff, 1, 1, 0, 0.40);
part_type_scale(pt_smoke_puff, 1, 1);
part_type_gravity(pt_smoke_puff, 0, 270);
part_type_blend(pt_smoke_puff, 0);
part_type_sprite(pt_smoke_puff, spr_effect_small_smokepuff, 1, 1, 0);
part_type_alpha1(ps_smoke_puff, 1);
part_type_colour_rgb(ps_smoke_puff, 255, 255, 255, 255, 255, 255);

#endregion

#region --- Tiny puff smoke effect

globalvar tinypuff_ps; tinypuff_ps = part_system_create();
globalvar tinypuff_pt; tinypuff_pt = part_type_create();
globalvar tinypuff_pe; tinypuff_pe = part_emitter_create(tinypuff_ps);

part_system_depth(tinypuff_ps, 0);
part_system_draw_order(tinypuff_ps, 1);

//part_emitter_region(tinypuff_ps, tinypuff_pe, x, x, y, y, 0, 1);
//part_emitter_burst(tinypuff_ps, tinypuff_pe, tinypuff_pt, 6);

part_type_orientation(tinypuff_pt, -359, 359, 0, 14, 0);
part_type_speed(tinypuff_pt, 0, 0, 0, 0.20);
part_type_direction(tinypuff_pt, -359, 359, 0, 14);
part_type_life(tinypuff_pt, 45, 75);
part_type_size(tinypuff_pt, 1, 1, 0, 0);
part_type_scale(tinypuff_pt, 1, 1);
part_type_gravity(tinypuff_pt, 0, 270);
part_type_blend(tinypuff_pt, 0);
part_type_sprite(tinypuff_pt, spr_effect_tinypuff, 1, 1, 0);
part_type_alpha1(tinypuff_ps, 1);
part_type_colour_rgb(tinypuff_ps, 255, 255, 255, 255, 255, 255);

#endregion

#region --- Laser lines effect

globalvar ps_laserlines; 
globalvar pt_laserlines; 
globalvar pt_laserlines; 
ps_laserlines = part_system_create();
pt_laserlines = part_type_create();
pt_laserlines = part_emitter_create(ps_laserlines);

part_system_depth(ps_laserlines, 300);
part_system_draw_order(ps_laserlines, 1);

part_type_orientation(pt_laserlines, 0, 360, 0, 0, 1);
part_type_speed(pt_laserlines, 4, 5, 0, 2);
part_type_direction(pt_laserlines, 0, 359, 0, 72);
//part_emitter_region(ps_laserlines, pt_laserlines, 555.00, 555.00, 388, 387.00, 0, 1);
//part_emitter_burst(ps_laserlines, pt_laserlines, pt_laserlines, 9);
part_type_life(pt_laserlines, 80, 120);
part_type_size(pt_laserlines, 2, 2, -0.20, 0.20);
part_type_scale(pt_laserlines, 1, 1);
part_type_gravity(pt_laserlines, 0, 270);
part_type_blend(pt_laserlines, 0);
part_type_shape(pt_laserlines, 0);
part_type_alpha1(ps_laserlines, 1);
part_type_colour2(ps_laserlines, 14738337, 15908608);

#endregion

#region --- Stars BKG effect

globalvar ps_bkgstars; 
globalvar pt_bkgstars; 
globalvar pe_bkgstars; 
ps_bkgstars = part_system_create();
pt_bkgstars = part_type_create();
pe_bkgstars = part_emitter_create(ps_bkgstars);

part_system_depth(ps_bkgstars, 700);
part_system_draw_order(ps_bkgstars, 1);
part_emitter_region(ps_bkgstars, pe_bkgstars, 0, room_width, 0, 1024, 0, 0);
part_emitter_stream(ps_bkgstars, pe_bkgstars, pt_bkgstars, -1);
part_type_orientation(pt_bkgstars, 0, 359, 0, 0, 1);
part_type_speed(pt_bkgstars, 0, 0, 0, 0);
part_type_direction(pt_bkgstars, -7, 7, 0, -7);
part_type_life(pt_bkgstars, 600, 1000);
part_type_size(pt_bkgstars, 0.60, 1, 0, 0);
part_type_scale(pt_bkgstars, 1, 1);
part_type_gravity(pt_bkgstars, 0, 270);
part_type_blend(pt_bkgstars, 0);
part_type_shape(pt_bkgstars, 0);
part_type_alpha3(ps_bkgstars, 0, 1, -0.02);
part_type_colour_rgb(ps_bkgstars, 255, 255, 255, 255, 255, 255);

#endregion

#region --- Clouds BKG effect


//room_speed=30
//background_color=0

globalvar ps_bkgclouds; 
globalvar pt_bkgclouds; 
globalvar pe_bkgclouds; 

ps_bkgclouds = part_system_create();
pt_bkgclouds = part_type_create();
pe_bkgclouds = part_emitter_create(ps_bkgclouds);

//part_emitter_region(ps_bkgclouds, pe_bkgclouds, 404.50, 733.50, 602.00, 480.00, 0, 0);
//part_emitter_burst(ps_bkgclouds, pe_bkgclouds, pt_bkgclouds, -1);
//part_system_depth(ps_bkgclouds, 700);

part_system_draw_order(ps_bkgclouds, 1);
part_type_orientation(pt_bkgclouds, 0, 359, 0, 0, 1);
part_type_speed(pt_bkgclouds, 0, 0, 0, 0);
part_type_direction(pt_bkgclouds, 0, 359, 0, 0);
part_type_life(pt_bkgclouds, 8*room_speed, 16*room_speed);
part_type_size(pt_bkgclouds, 2, 5, 0, 0.05);
part_type_scale(pt_bkgclouds, 1, 1);
part_type_gravity(pt_bkgclouds, 0, 270);
part_type_blend(pt_bkgclouds, 0);
part_type_sprite(pt_bkgclouds, spr_cloud_particle, 0, 0, 1);
//part_type_shape(pt_bkgstars, pt_shape_cloud);
part_type_alpha3(ps_bkgclouds, 0.01, 0.05, 0);
part_type_colour_rgb(ps_bkgclouds, 255, 255, 255, 255, 255, 255);

#endregion

#region --- MG Muzzle effect

globalvar ps_mg_muzzle; 
globalvar pt_mg_muzzle;
globalvar pe_mg_muzzle;
ps_mg_muzzle = part_system_create(); 
pt_mg_muzzle = part_type_create();
pe_mg_muzzle = part_emitter_create(ps_mg_muzzle);

//part_emitter_burst(ps_mg_muzzle, pe_mg_muzzle, pt_mg_muzzle, -12);
//part_emitter_stream(ps_mg_muzzle, pe_mg_muzzle, pt_mg_muzzle, -12);
//part_type_orientation(pt_mg_muzzle, 0, 359, 0, 0, 1);
//part_emitter_region(ps_mg_muzzle, pe_mg_muzzle, x, x, y, y, 0, 1);
//part_type_direction(pt_mg_muzzle, -359, 359, 0, 0);

part_system_depth(ps_mg_muzzle, 0);
part_system_draw_order(ps_mg_muzzle, 1);
part_type_speed(pt_mg_muzzle, 5, 5, 0, 0);
part_type_life(pt_mg_muzzle, 0.1*room_speed, 0.2*room_speed);
part_type_size(pt_mg_muzzle, 1, 1, 0, 0.40);
part_type_scale(pt_mg_muzzle, 1, 1);
part_type_gravity(pt_mg_muzzle, 0, 270);
part_type_blend(pt_mg_muzzle, 0);
part_type_sprite(pt_mg_muzzle, spr_effect_muzzle, 0, 0, 1);
part_type_alpha1(ps_mg_muzzle, 1);
part_type_colour_rgb(ps_mg_muzzle, 255, 255, 255, 255, 255, 255);

#endregion

#region --- MG Casing effect

globalvar ps_mg_casing; 
globalvar pt_mg_casing;
globalvar pe_mg_casing;
ps_mg_casing = part_system_create(); 
pt_mg_casing = part_type_create();
pe_mg_casing = part_emitter_create(ps_mg_casing);

//part_emitter_burst(ps_mg_casing, pe_mg_casing, pt_mg_casing, -12);
//part_emitter_stream(ps_mg_casing, pe_mg_casing, pt_mg_casing, -12);
//part_type_orientation(pt_mg_casing, 0, 359, 0, 0, 1);
//part_emitter_region(ps_mg_casing, pe_mg_casing, x, x, y, y, 0, 1);
//part_type_direction(pt_mg_casing, -359, 359, 0, 0);

part_system_depth(ps_mg_casing, 0);
part_system_draw_order(ps_mg_casing, 1);
part_type_speed(pt_mg_casing, 0.15, 0.25, 0, 0);
part_type_life(pt_mg_casing, 1*room_speed, 2*room_speed);
part_type_size(pt_mg_casing, 1, 1, 0, 0);
part_type_scale(pt_mg_casing, 1, 1);
part_type_gravity(pt_mg_casing, 0.1, 270);
part_type_blend(pt_mg_casing, 0);
part_type_sprite(pt_mg_casing, spr_effect_bullet_casing, 1, 0, 0);
part_type_alpha1(ps_mg_casing, 1);
part_type_colour_rgb(ps_mg_casing, 255, 255, 255, 255, 255, 255);

#endregion

#endregion

#region -- Console

console_order = 0;
for (i=0; i<10; i++)
{
	console_line[i]="";
	console_order++;
}
console_a_fade = 1;

#endregion

show_debug_message("//FLYENGINE: init done");
//part_system_drawit()

//show_debug_overlay(true);
//show_debug_message(string(gamespeed_fps)+" | "+ string(fps)+":"+string(fps_real));