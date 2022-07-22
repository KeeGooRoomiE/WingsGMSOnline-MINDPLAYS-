/// @description Out of space
// You can write your code in this editor
alarm[3]=1*room_speed;

if (isOut)
{
	outCounter += 1;
	//show_debug_message("Out counter is: "+string(outCounter));
	canShowCounter = true;
	counterScale = 1;
	counterAlpha = 1;
} else
{
	outCounter = 0;
	canShowCounter = false;
	//show_debug_message("Counter null");
}

if (outCounter >= 10) 
{
	planeOut = true;
}