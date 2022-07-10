/// draw some player stats

if (speed < 1)
{
	draw_sprite_ext(sprite_index, isLocalPlayer, x, y,1,1,direction,c_white,1);
} else
{
	draw_sprite_ext(sprPlayer34, isLocalPlayer, x, y,1,1,direction,c_white,1);
}

draw_set_color(c_white); draw_set_font(ftArial);
draw_set_halign(fa_center); draw_set_valign(fa_bottom);
draw_text(x, y - 64, string(playerId) + "|" + string(username));
image_blend = c_white;

