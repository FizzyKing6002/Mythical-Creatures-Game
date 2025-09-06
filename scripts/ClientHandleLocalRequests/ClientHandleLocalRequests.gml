/// @self obj_client
function handle_client_ready_request (_state)
{
	if approve_client_ready(_state)
	{
		send_player_ready_request(_state);
		return;
	}
	show_debug_message("Self was already ready, request ignored.");
}

/// @self obj_client
function handle_client_join_team_request (_team)
{
	if approve_client_join_team(_team)
	{
		send_player_join_team_request(_team);
		return;
	}
	show_debug_message("Self was already ready, request ignored.");
}

/// @self obj_client
function handle_client_party_select_next_request ()
{
	if approve_client_party_select_next()
	{
		send_player_party_select_next_request();
		return;
	}
	show_debug_message("Party select next denied.");
}

/// @self obj_client
function handle_client_party_select_creature_request (_creature)
{
	if approve_client_party_select_creature(_creature)
	{
		send_player_party_select_creature_request(_creature);
		return;
	}
	show_debug_message("Party select creature denied.");
}