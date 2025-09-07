textColor = c_white;
text = "Confirm";

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");



function select_action ()
{
	localHostObj.localRequests.partySelectNext.request = true;
}

function self_get_current_party_slot_empty ()
{
	return local_get_current_party_slot_empty();
}