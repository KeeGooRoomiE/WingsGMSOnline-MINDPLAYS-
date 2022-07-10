/// @description Insert description here
// You can write your code in this editor

#region -- Hour timescale setup

//DEBUG
//hour = (hour+0.01)%24;

//REAL
hour = date_get_hour(date_current_datetime());

#endregion

#region -- Cycle BKG Colours smooth shift

if ( in_range(hour,6,18) )
{
	daytime = true;
}
else
{
	daytime = false;
}

if (daytime)
{
	//each colour value, man...
	if (cur_c1r < day_c1r) { cur_c1r += step;} else { cur_c1r = day_c1r; }
	if (cur_c1g < day_c1g) { cur_c1g += step;} else { cur_c1g = day_c1g; }
	if (cur_c1b < day_c1b) { cur_c1b += step;} else { cur_c1b = day_c1b; }
	
	if (cur_c2r < day_c2r) { cur_c2r += step;} else { cur_c2r = day_c2r; }
	if (cur_c2g < day_c2g) { cur_c2g += step;} else { cur_c2g = day_c2g; }
	if (cur_c2b < day_c2b) { cur_c2b += step;} else { cur_c2b = day_c2b; }
	
	if (cur_c3r > day_c3r) { cur_c3r -= step;} else { cur_c3r = day_c3r; }
	if (cur_c3g < day_c3g) { cur_c3g += step/5;} else { cur_c3g = day_c3g; }
	if (cur_c3b < day_c3b) { cur_c3b += step;} else { cur_c3b = day_c3b; }
	//cur_c1 = day_c1;
	//cur_c2 = day_c2;
	//cur_c3 = day_c3;
}
else
{
	if (cur_c1r > night_c1r) { cur_c1r -= step;} else { cur_c1r = night_c1r; }
	if (cur_c1g > night_c1g) { cur_c1g -= step;} else { cur_c1g = night_c1g; }
	if (cur_c1b > night_c1b) { cur_c1b -= step;} else { cur_c1b = night_c1b; }
	
	if (cur_c2r > night_c2r) { cur_c2r -= step;} else { cur_c2r = night_c2r; }
	if (cur_c2g > night_c2g) { cur_c2g -= step;} else { cur_c2g = night_c2g; }
	if (cur_c2b > night_c2b) { cur_c2b -= step;} else { cur_c2b = night_c2b; }
	
	if (cur_c3r < night_c3r) { cur_c3r += step;} else { cur_c3r = night_c3r; }
	if (cur_c3g > night_c3g) { cur_c3g -= step/5;} else { cur_c3g = night_c3g; }
	if (cur_c3b > night_c3b) { cur_c3b -= step;} else { cur_c3b = night_c3b; }
	//cur_c1 = night_c1;
	//cur_c2 = night_c2;
	//cur_c3 = night_c3;
}

cur_c1 = make_color_rgb(cur_c1r, cur_c1g, cur_c1b);
cur_c2 = make_color_rgb(cur_c2r, cur_c2g, cur_c2b);
cur_c3 = make_color_rgb(cur_c3r, cur_c3g, cur_c3b);

#endregion

//
//