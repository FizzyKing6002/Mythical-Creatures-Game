if localHostObj == noone then exit;

var _partySelectStage = localHostObj.combatData.partySelectStage;
var _teamSelecting = self_get_team_selecting();

if self_get_current_party_slot_empty() ||
	team == Team.None ||
	( team == Team.Blue && _teamSelecting != Team.Blue ) ||
	( team == Team.Red && _teamSelecting != Team.Red )
{
	image_index = 3;
	exit;
}
if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
{
	if mouse_check_button(mb_left)
	{
		image_index = 2;
		if mouse_check_button_pressed(mb_left) then select_action();
		exit;
	}
	image_index = 1;
	exit;
}
image_index = 0;