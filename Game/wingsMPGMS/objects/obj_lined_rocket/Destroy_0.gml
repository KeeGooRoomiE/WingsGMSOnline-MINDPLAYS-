/// @description Destroy with effect
// You can write your code in this editor

if (wEffect)
{
	//MAKE EXPL EFFECT
	part_emitter_region(ps_explosion, pe_explosion, x, x, y, y, 0, 1);
	part_type_direction(pt_explosion, direction, direction, 0, 22);
	part_emitter_burst(ps_explosion, pe_explosion, pt_explosion, 1);
}