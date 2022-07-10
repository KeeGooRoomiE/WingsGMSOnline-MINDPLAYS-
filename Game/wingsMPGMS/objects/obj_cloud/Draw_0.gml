/// @description Insert description here
// You can write your code in this editor
//
//draw_self();
//var xx, yy;
//xx = x + irandom_range(-256,256);
//yy = y + irandom_range(-96,96);
/*
var xxx, yyy;
xxx = x + irandom_range(64,192) + irandom_range(-64,64);
yyy = y + irandom_range(64,96) + irandom_range(-64,64);

var xxxx, yyyy;
xxxx = x + irandom_range(-64,-192) + irandom_range(-64,64);
yyyy = y + irandom_range(-64,-96) + irandom_range(-64,64);

var xxxxx, yyyyy;
xxxxx = x + irandom_range(-272,272);
yyyyy = y + irandom_range(-128,128);
*/
part_emitter_region(ps_bkgclouds, pe_bkgclouds, x-192, x+192, y-80, y+80, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(ps_bkgclouds, pe_bkgclouds, pt_bkgclouds, -4);
part_system_depth(ps_bkgclouds, depth-1);
part_type_colour_rgb(ps_bkgclouds, 255, 255, 255, 255, 255, 255);

//draw_particle_cloud(x-192,x+192,y-64,y+64,depth-1,-5);

//draw_particle_cloud(xxxx,xxxx,yyyy,yyyy,depth-1,-6);
for (i=0; i<6; i++)
{	
	//draw_sprite(spr_icon_ai,0,xx[i],yy[i])
	
	//draw_particle_cloud(xx-96,xx+96,yy-96,yy+96,depth-1,-6);
	part_emitter_region(ps_bkgclouds, pe_bkgclouds, xx[i]-48, xx[i]+48, yy[i]-48, yy[i]+48, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps_bkgclouds, pe_bkgclouds, pt_bkgclouds, -16);
	part_system_depth(ps_bkgclouds, depth-1);
	part_type_colour_rgb(ps_bkgclouds, 255, 255, 255, 255, 255, 255);
}

//draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_orange,0.15);