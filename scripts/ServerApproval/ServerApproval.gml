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
function approve_server_party_select_start ()
{
	return get_all_players_ready() && get_num_non_spectators() == 2;
}

/// @self obj_server
function approve_server_party_select_timeout ()
{
	return true;
}

/// @self obj_server
function approve_player_party_select_next (_steamID)
{
	return player_currently_selecting(_steamID) && !get_current_party_slot_empty();
}

/// @self obj_server
function approve_server_party_select_next ()
{
	return approve_player_party_select_next(steamID);
}

/// @self obj_server
function approve_player_party_select_creature (_steamID, _creature)
{
	return player_currently_selecting(_steamID) && !get_creature_chosen(_creature);
}

/// @self obj_server
function approve_server_party_select_creature (_creature)
{
	return approve_player_party_select_creature(steamID, _creature);
}

/// @self obj_server
function approve_server_combat_start ()
{
	return true;
}