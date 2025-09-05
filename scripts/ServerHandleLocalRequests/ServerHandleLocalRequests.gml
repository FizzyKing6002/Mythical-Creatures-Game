/// @self obj_server
function handle_server_combat_start_request ()
{
	if approve_server_combat_start()
	{
		send_combat_start();
		room_goto(rm_combat);
		return;
	}
	show_debug_message("Combat start denied.");
}

/// @self obj_server
function handle_server_join_team_request (_team)
{
	if approve_server_join_team(_team)
	{
		send_player_join_team_accept(steamID, _team);
		
		make_player_join_team(steamID, _team);
		
		return;
	}
	show_debug_message("Team was full, request denied.");
}