textColor = c_white;

text = "Ready";

image_xscale = 2.75;
image_yscale = 1.25;



function select_action ()
{
	if self_get_ready() then
	{
		global.client.localRequests.ready.request = true;
		global.client.localRequests.ready.state = true;
		text = "Unready";
		return;
	}
	global.client.localRequests.ready.request = true;
	global.client.localRequests.ready.state = false;
	text = "Ready";
}

function self_get_ready ()
{
	return global.client.local_get_player_ready(global.client.steamID);
}

function self_get_spectating ()
{
	return global.client.local_get_player_spectating(global.client.steamID);
}