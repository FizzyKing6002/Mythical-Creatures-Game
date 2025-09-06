textColor = c_white;

text = "Join None";
team = Team.None;

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");



function select_action ()
{
	localHostObj.localRequests.joinTeam.request = true;
	
	switch team
	{
		case Team.Blue: localHostObj.localRequests.joinTeam.team = Team.Blue; break;
		case Team.Red: localHostObj.localRequests.joinTeam.team = Team.Red; break;
		case Team.None: localHostObj.localRequests.joinTeam.team = Team.None; break;
		default: show_debug_message("Team not accounted for..."); break;
	}
}

function self_get_team_full ()
{
	return localHostObj.local_get_team_full(team);
}

function self_get_team ()
{
	return localHostObj.local_get_player_team(localHostObj.steamID);
}