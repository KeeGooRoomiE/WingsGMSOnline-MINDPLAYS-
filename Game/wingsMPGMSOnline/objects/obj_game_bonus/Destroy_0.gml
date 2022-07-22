/// @description Insert description here
// You can write your code in this editor


if (instance_exists(global.controller))
{
	if (global.controller.bonusCount > 0)
	{
		global.controller.bonusCount -= 1;
	}
}
sio_emit_destroy_bonus();
