/// @description Insert description here
// You can write your code in this editor




//
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
//if (debug_mode)
{
	draw_text(10,10,"FPS: "+string(global.SetFPSRate)+"(set) | "+ string(fps)+"(counted):"+string(round(fps_real))+"(real)");
	draw_text(10,24,"Render: "+string(global.renderSize)+"(scale) | " + string(view_get_wport(0))+"x"+ string(view_get_hport(0))+"(window)");
}
//

for (i=5; i>0; i-=1)
{
	draw_text_color(24,36+(16*i),string(console_line[console_order-i]),c_white,c_white,c_white,c_white,console_a_fade-i/5 );
}