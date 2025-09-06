textColor = c_white;

text = "Start Game";

image_xscale = 2.75;
image_yscale = 1.25;



function select_action ()
{
	global.server.localRequests.partySelectStart.request = true;
}

function self_get_all_players_ready ()
{
	return global.server.local_get_all_players_ready();
}

function self_get_num_non_spectators ()
{
	return global.server.local_get_num_non_spectators();
}