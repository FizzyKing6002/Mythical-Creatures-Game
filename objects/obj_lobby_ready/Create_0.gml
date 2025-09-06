textColor = c_white;

text = "Ready";

image_xscale = 2.75;
image_yscale = 1.25;



function select_action ()
{
	global.client.localRequests.ready.request = true;
	global.client.localRequests.ready.state = !self_get_ready();
}

function self_get_ready ()
{
	return global.client.local_get_player_ready(global.client.steamID);
}

function self_get_team ()
{
	return global.client.local_get_player_team(global.client.steamID);
}