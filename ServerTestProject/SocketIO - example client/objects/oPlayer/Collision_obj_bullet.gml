/// @description Insert description here
// You can write your code in this editor

if (other.ownerId != playerId)
{
	//instance_destroy(other);
	with (other)
	{
		show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" collided w/ player... try to delete;");
		canUpdate = false;
		show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" canUpdate = false;");
		sio_emit_destroy_bullet(4);
	}
	hp -= 5;
	//show_message("bullet hit");
	sio_emit_hp_update();
}