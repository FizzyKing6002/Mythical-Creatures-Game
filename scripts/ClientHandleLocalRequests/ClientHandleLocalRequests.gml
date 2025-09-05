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