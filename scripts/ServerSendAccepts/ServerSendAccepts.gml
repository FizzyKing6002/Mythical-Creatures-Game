/// @self obj_server
function send_player_sync_accept (_steamID = 0)
{
	var _b = buffer_create_player_sync_accept();
	if _steamID == 0 then buffer_bounce_server_to_clients(_b);
	else buffer_relay_server_to_client(_b, _steamID);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_ready_accept (_steamID, _state)
{
	var _b = buffer_create_player_ready_accept(_steamID, _state);
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_join_team_accept (_steamID, _team)
{
	var _b = buffer_create_player_join_team_accept(_steamID, _team);
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_party_select_start_event ()
{
	var _b = buffer_create_party_select_start_event();
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_party_select_timeout_event (_creature)
{
	var _b = buffer_create_party_select_timeout_event(_creature);
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_party_select_next_accept ()
{
	var _b = buffer_create_player_party_select_next_accept();
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_party_select_creature_accept (_creature)
{
	var _b = buffer_create_player_party_select_creature_accept(_creature);
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_combat_start_event ()
{
	var _b = buffer_create_combat_start_event();
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}