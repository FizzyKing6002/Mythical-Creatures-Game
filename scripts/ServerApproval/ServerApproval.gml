/// @self obj_server
function approve_player_sync (_steamID)
{
	return true;
}

/// @self obj_server
function approve_player_ready (_steamID, _state)
{
	return _state != get_player_ready(_steamID);
}

/// @self obj_server
function approve_player_join_team (_steamID, _team)
{
	return !get_team_full(_team);
}

/// @self obj_server
function approve_server_join_team (_team)
{
	return approve_player_join_team(steamID, _team);
}

/// @self obj_server
function approve_server_combat_start ()
{
	return get_all_players_ready();
}