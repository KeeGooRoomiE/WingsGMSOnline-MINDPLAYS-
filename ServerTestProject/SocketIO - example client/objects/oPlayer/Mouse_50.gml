/// @description Insert description here
// You can write your code in this editor
if(isLocalPlayer)
{
	if (canShot)
	{
		canShot = false;
		alarm[0]=reloadTime;
		sio_emit_create_bullet(playerId,10,direction,x,y);
		sio_emit_position_update();
	}
}