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

/// @self obj_server
function handle_server_party_select_start_request ()
{
	if approve_server_party_select_start()
	{
		fill_ids_of_team_players();
		
		send_combat_sync_accept();
		send_party_select_start_event();
		
		room_goto(rm_party_select);
		return;
	}
	show_debug_message("Party select start denied.");
}

/// @self obj_server
function handle_server_party_select_timeout_request ()
{
	if approve_server_party_select_timeout()
	{
		var _creature = Creature.None;
		if get_current_party_slot_empty() then _creature = pick_random_available_creature();
		
		send_combat_sync_accept();
		send_party_select_timeout_event(_creature);
		
		if _creature != Creature.None then change_current_creature(_creature);
		next_party_select_stage();
		return;
	}
	show_debug_message("Party select timeout denied.");
}

/// @self obj_server
function handle_server_party_select_next_request ()
{
	if approve_server_party_select_next()
	{
		send_combat_sync_accept();
		send_player_party_select_next_accept();
		
		next_party_select_stage();
		return;
	}
	show_debug_message("Party select next denied.");
}

/// @self obj_server
function handle_server_party_select_creature_request (_creature)
{
	if approve_server_party_select_creature(_creature)
	{
		send_player_party_select_creature_accept(_creature);
		change_current_creature(_creature);
		return;
	}
	show_debug_message("Party select creature denied.");
}

/// @self obj_server
function handle_server_combat_start_request ()
{
	if approve_server_combat_start()
	{
		send_combat_start_event();
		room_goto(rm_combat);
		return;
	}
	show_debug_message("Combat start denied.");
}