/// @self obj_client
function buffer_relay_client_to_server (_b)
{
	steam_net_packet_send(hostID, _b);
}

/// @self obj_server
function buffer_relay_server_to_client (_b, _toID)
{
	steam_net_packet_send(_toID, _b);
}

/// @self obj_server
function buffer_bounce_server_to_clients (_b)
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		steam_net_packet_send(playerList[_i].steamID, _b);
	}
}



/// @self obj_client
function data_relay_client_to_server (_data)
{
	var _json = json_stringify(_data);
	
	var _b = buffer_create(string_byte_length(_json), buffer_fixed, 1);
	buffer_write(_b, buffer_text, _json);
	
	steam_net_packet_send(hostID, _b);
	buffer_delete(_b);
}

/// @self obj_server
function data_relay_server_to_client (_data, _toID)
{
	var _json = json_stringify(_data);
	
	var _b = buffer_create(string_byte_length(_json), buffer_fixed, 1);
	buffer_write(_b, buffer_text, _json);
	
	steam_net_packet_send(_toID, _b);
	buffer_delete(_b);
}

/// @self obj_server
function data_bounce_server_to_clients (_data)
{
	var _json = json_stringify(_data);
	
	var _b = buffer_create(string_byte_length(_json), buffer_fixed, 1);
	buffer_write(_b, buffer_text, _json);
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		steam_net_packet_send(playerList[_i].steamID, _b);
	}
	buffer_delete(_b);
}