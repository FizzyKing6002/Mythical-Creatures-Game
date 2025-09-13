for (var _i = 0; _i <= completedSegments; _i++)
{
	if _i == PartySelectStage.Blue1 || _i == PartySelectStage.Blue2 ||
		_i == PartySelectStage.Blue3 || _i == PartySelectStage.Blue4 then draw_set_color(c_navy);
	else if _i == PartySelectStage.Red1 || _i == PartySelectStage.Red2 ||
		_i == PartySelectStage.Red3 || _i == PartySelectStage.Red4 then draw_set_color(c_maroon);
	
	if _i == 8
	{
		draw_set_color(c_black);
		draw_rectangle(0, 0, segmentProgress*room_width, 15, false);
		
		break;
	}
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