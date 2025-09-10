textColor = c_white;
text = "Confirm";
team = Team.None;

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");

if localHostObj != noone
{
	if localHostObj.combatData.blueID == localHostObj.steamID then team = Team.Blue;
	else if localHostObj.combatData.redID == localHostObj.steamID then team = Team.Red;
}



function select_action ()
{
	localHostObj.localRequests.partySelectNext.request = true;
}

function self_get_current_party_slot_empty ()
{
	return localHostObj.local_get_current_party_slot_empty();
}