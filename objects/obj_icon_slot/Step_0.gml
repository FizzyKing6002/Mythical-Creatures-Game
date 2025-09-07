if localHostObj == noone then exit;

var _partySelectStage = localHostObj.combatData.partySelectStage

if team == Team.None ||
	( team == Team.Blue && !array_contains([0, 3, 4, 6], _partySelectStage) ) ||
	( team == Team.Red && !array_contains([1, 2, 5, 7], _partySelectStage) )
{
	image_alpha = 1;
	exit;
}
if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
{
	if mouse_check_button(mb_left)
	{
		image_alpha = 0.75;
		if mouse_check_button_pressed(mb_left) then select_action();
		exit;
	}
	image_alpha = 0.85;
	exit;
}
image_alpha = 1;