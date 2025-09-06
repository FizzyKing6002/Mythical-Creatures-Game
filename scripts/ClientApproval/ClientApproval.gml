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

/// @self obj_client
function approve_client_party_select_next ()
{
	return player_currently_selecting(steamID) && get_current_party_slot_empty();
}

/// @self obj_client
function approve_client_party_select_creature (_creature)
{
	return player_currently_selecting(steamID) && !get_creature_chosen(_creature);
}