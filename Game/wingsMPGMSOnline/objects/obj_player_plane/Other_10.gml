/// @description Speed effect

var s = instance_create_depth(x,y,depth-1,obj_spdeff);
s.image_angle = direction;
s.direction = direction;
s.speed = spd/10;