/// @self obj_client
function approve_client_ready (_state)
{
	return _state != get_player_ready(steamID);
}

/// @self obj_client
function approve_client_join_team (_team)
{
	return !get_team_full(_team);
}