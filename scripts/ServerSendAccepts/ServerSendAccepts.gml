/// @self obj_server
function send_player_sync_accept (_steamID = 0)
{
	var _b = buffer_create_player_sync_accept();
	if _steamID == 0 then buffer_bounce_server_to_clients(_b);
	else buffer_relay_server_to_client(_b, _steamID);
	buffer_delete(_b);
}

/// @self obj_server
function send_player_ready_accept (_steamID)
{
	var _b = buffer_create_player_ready_accept(_steamID);
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}

/// @self obj_server
function send_game_start ()
{
	var _b = buffer_create_game_start();
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}