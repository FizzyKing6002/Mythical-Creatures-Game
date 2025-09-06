textColor = c_white;
text = "Team Select";

teamSlot = 0;
displaySprite = undefined;

image_xscale = 2;

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");



function select_action ()
{
	if !instance_exists(obj_data) then { show_debug_message("Data object not initialised."); return; }
	global.data.teamSelectedSlot = teamSlot;
}