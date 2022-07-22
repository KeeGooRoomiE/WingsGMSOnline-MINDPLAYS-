/// @description AI plane spawner
// You can write your code in this editor

if (global.isAIEnabled)
{
	alarm[0] = 21*room_speed;//71*room_speed;

	repeat (irandom_range(1,3))
	{
		var side = choose(0,1,2);
		//0 - left
		//1 - up
		//2 - right

		switch (side)
		{
			default: instance_create_layer(irandom(room_width),-96,"Active",obj_dummy_plane); break;
			case 0: instance_create_layer(-96,irandom(room_height),"Active",obj_dummy_plane); break;
			case 1: instance_create_layer(irandom(room_width),-96,"Active",obj_dummy_plane); break;
			case 2: instance_create_layer(room_width+96,irandom(room_height),"Active",obj_dummy_plane); break;
		}

		show_debug_message("//FLYENGINE: Nesterov AI plane entered the field");
	}
}