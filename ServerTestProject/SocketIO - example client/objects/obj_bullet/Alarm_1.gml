/// @description Insert description here
// You can write your code in this editor

alarm[1]=0.1*room_speed;

if (err = true)
{
	show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" error found, try to delete...");
	sio_emit_destroy_bullet(1);
} else
{
	if (canUpdate)
	{
		//sio_emit_bullet_update();
	}
}