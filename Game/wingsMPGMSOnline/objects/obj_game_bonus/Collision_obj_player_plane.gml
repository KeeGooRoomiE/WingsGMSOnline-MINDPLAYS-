/// @description Insert description here
// You can write your code in this editor


switch (bonusType)
{
	case 0: break;							//nothing
	case 1: other.hp += 50; break;			//+50 HP
	case 2: other.weaponType = 0; break;	//AIM ROCKET
	case 3: other.weaponType = 1; break;	//TRIPLE ROCKET
	case 4: other.weaponType = 3; break;	//PUNCH
	case 5: other.weaponType = 2; break;	//LASER
	default: break;							//ERROR
}

with (other)
{
	sio_emit_hp_update();
	sio_emit_position_update();
}

instance_destroy(self);
