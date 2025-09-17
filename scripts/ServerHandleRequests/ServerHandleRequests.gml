/// @self obj_server
function handle_player_sync_request (_senderID, _b)
{
	if approve_player_sync(_senderID)
	{
		send_player_sync_accept(_senderID);
		return;
	}
	show_debug_message("Player sync denied.")
}

/// @self obj_server
function handle_player_ready_request (_senderID, _b)
{
	var _stateNum = buffer_read(_b, buffer_u8);
	var _stateBool = _stateNum != 0;
	
	if approve_player_ready(_senderID, _stateBool)
	{
		send_player_ready_accept(_senderID, _stateBool);
		make_player_ready(_senderID, _stateBool);
		return;
	}
	show_debug_message("Player attempted to change ready state to current state, request ignored.");
}

/// @self obj_server
function handle_player_join_team_request (_senderID, _b)
{
	var _team = buffer_read(_b, buffer_u8);
	
	if approve_player_join_team(_senderID, _team)
	{
		send_player_join_team_accept(_senderID, _team);
		
		if _team == Team.None then make_player_ready(_senderID, true);
		else make_player_ready(_senderID, false);
		make_player_join_team(_senderID, _team);
		
		return;
	}
	show_debug_message("Player attempted to join full team, request denied.");
}

/// @self obj_server
function handle_player_party_select_next_request (_senderID, _b)
{
	if approve_player_party_select_next(_senderID)
	{
		send_combat_sync_accept();
		send_player_party_select_next_accept();
		
		next_party_select_stage();
		return;
	}
	show_debug_message("Player was denied moving to next party slot.")
}

/// @self obj_server
function handle_player_party_select_creature_request (_senderID, _b)
{
	var _creature = buffer_read(_b, buffer_u8);
	
	if approve_player_party_select_creature(_senderID, _creature)
	{
		send_player_party_select_creature_accept(_creature);
		change_current_creature(_creature);
		return;
	}
	show_debug_message("Player was denied selecting a creature for party.")
}