textColor = c_white;
text = "Team Select";

teamSlot = 0;

image_xscale = 2;

displaySprite = undefined;



function select_action ()
{
	if !instance_exists(obj_data) then { show_debug_message("Data object not initialised."); return; }
	global.data.teamSelectedSlot = teamSlot;
}