/// @self obj_client
function send_player_sync_request ()
{
	var _b = buffer_create_player_sync_request();
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}

/// @self obj_client
function send_player_ready_request (_state)
{
	var _b = buffer_create_player_ready_request(_state);
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}

/// @self obj_client
function send_player_join_team_request (_team)
{
	var _b = buffer_create_player_join_team_request(_team);
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_party_select_next_request ()
{
	var _b = buffer_create_player_party_select_next_request();
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_party_select_creature_request (_creature)
{
	var _b = buffer_create_player_party_select_creature_request(_creature);
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}