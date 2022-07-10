//Generate new seed
randomize();

// ping related
ping = 0;
alarm[0] = room_speed * 2;
alarm[1]=5*room_speed;

global.localPl = noone;

browser_input_capture(true);

globalvar Part0; Part0 = part_system_create()
globalvar PartType0; PartType0 = part_type_create()
globalvar PartEmitter0; PartEmitter0 = part_emitter_create(Part0)
part_system_depth(Part0, 99)
part_system_draw_order(Part0, 1)
part_emitter_region(Part0, PartEmitter0, 0, room_width, 0, room_height, 0, 0)
part_emitter_stream(Part0, PartEmitter0, PartType0, 2)
part_type_orientation(PartType0, 0, 359, 0, 0, 1)
part_type_speed(PartType0, 0.05, 0.1, 0, 0)
part_type_direction(PartType0, 270, 270, 0, 0)
part_type_life(PartType0, 600, 1000)
part_type_size(PartType0, 0.60, 1, 0, 0)
part_type_scale(PartType0, 1, 1)
part_type_gravity(PartType0, 0, 270)
part_type_blend(PartType0, 0)
part_type_shape(PartType0, 0)
part_type_alpha3(Part0, 0, 1, -0.02)
part_type_colour_rgb(Part0, 255, 255, 255, 255, 255, 255)

