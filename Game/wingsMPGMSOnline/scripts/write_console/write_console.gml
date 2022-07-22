// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function write_console(str){

	if (instance_exists(global.controller))
	{

		
		global.controller.console_line[global.controller.console_order]=str;
		global.controller.console_a_fade = 1;
		global.controller.console_order++;
		
	}
}