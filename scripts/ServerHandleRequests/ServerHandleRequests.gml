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
	var _stateNum = buffer_read(inbuf, buffer_u8);
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
	var _team = buffer_read(inbuf, buffer_u8);
	
	if approve_player_join_team(_senderID, _team)
	{
		send_player_join_team_accept(_senderID, _team);
		make_player_join_team(_senderID, _team);
		return;
	}
	show_debug_message("Player attempted to join full team, request denied.");
}