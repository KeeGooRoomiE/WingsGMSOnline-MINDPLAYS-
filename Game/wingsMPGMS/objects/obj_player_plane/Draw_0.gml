/// @description Draw plane
// You can write your code in this editor
var vxm = camera_get_view_x(view_camera[0])+(camera_get_view_width(view_camera[0])/2);
var vym = camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])/2)
	
draw_self();
image_speed = 0;
image_index = 1;

draw_sprite_ext(sprite_index,2,x,y,1,vertRot,image_angle,c_white,1);

#region -- Show counter

if (canShowCounter)
{		
	draw_sprite_ext(spr_ui_fill,0,vxm,vym,36,36,0,c_black,0+0.1*outCounter);
	draw_sprite_ext(spr_ui_counter,10-(outCounter+1),vxm,vym,counterScale,counterScale,0,c_blue,counterAlpha);
	
	if (counterScale<5)
	{
		counterScale+=0.1;
	}
	if (counterAlpha>0)
	{
		counterAlpha -=0.01;
	}
}

#endregion

draw_sprite_ext(spr_ui_fill,0,vxm,vym,36,36,0,c_black,1-0.01*hp);

#region -- Draw laser beam

if (isLaserShooting)
{
	if (laserAmmo > 0)
	{
		var sx = x + lengthdir_x(24,direction);
		var sy = y + lengthdir_y(24,direction);
		var bx = x + lengthdir_x(32,direction);
		var by = y + lengthdir_y(32,direction);
		var ex = x + lengthdir_x(laserLength-8,direction);
		var ey = y + lengthdir_y(laserLength-8,direction);
		
		draw_sprite_ext(spr_laser_prop,0,sx,sy,1,1,direction,c_white,1);
		draw_sprite_ext(spr_laser_prop,1,bx,by,laserLength/20,1,direction,c_white,1);
		draw_sprite_ext(spr_laser_prop,2,ex,ey,1,1,direction,c_white,1);
		
		part_type_direction(pt_laserlines, direction, direction, 0, 72);
		part_emitter_region(ps_laserlines, pt_laserlines, bx, bx, sy, sy, 0, 1);
		part_emitter_burst(ps_laserlines, pt_laserlines, pt_laserlines, -1);
		
		part_emitter_region(ps_laserlines, pt_laserlines, ex, ex, ey, ey, 0, 1);
		part_emitter_burst(ps_laserlines, pt_laserlines, pt_laserlines, 4);
	}
}

#endregion

#region -- Draw punch

if (isPunching)
{
	draw_sprite_ext(spr_effect_punch,0,x,y,1, 1,image_angle,c_white,1);
}

#endregion
