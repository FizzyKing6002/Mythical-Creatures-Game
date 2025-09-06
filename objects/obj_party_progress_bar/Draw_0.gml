for (var _i = 0; _i <= completedSegments; _i++)
{
	if _i == 0 || _i == 3 || _i == 4 || _i == 6 then draw_set_color(c_navy);
	else if _i == 1 || _i == 2 || _i == 5 || _i == 7 then draw_set_color(c_maroon);
	
	if _i == completedSegments
	{
		draw_rectangle(_i*room_width/8, 0, _i*room_width/8 + segmentProgress*room_width/8, 15, false);
		
		draw_set_color(c_black);
		draw_rectangle(_i*room_width/8, 0, _i*room_width/8 + segmentProgress*room_width/8, 15, true);
		
		break;
	}
	
	draw_rectangle(_i*room_width/8, 0, (_i+1)*room_width/8, 15, false);
	
	draw_set_color(c_black);
	draw_rectangle(_i*room_width/8, 0, (_i+1)*room_width/8, 15, true);
}