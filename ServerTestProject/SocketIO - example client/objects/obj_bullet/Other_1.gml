/// @description Insert description here
// You can write your code in this editor

show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" bordered... try to delete...");

canUpdate = false;
show_debug_message("//client bullet w/ bulletId:"+string(bulletId)+" canUpdate = false;");
sio_emit_destroy_bullet(2);
