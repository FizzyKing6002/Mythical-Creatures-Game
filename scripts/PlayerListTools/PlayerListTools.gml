/// @self obj_device_handler
function get_index_by_player_id (_steamID)
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if playerList[_i].steamID == _steamID then return _i;
	}
	show_debug_message("Player not found in player list...");
	return -1;
}

/// @self obj_device_handler
function get_player_ready (_steamID)
{
	var _index = get_index_by_player_id(_steamID);
	
	if _index == -1 then { show_debug_message("Target to get ready status not found..."); return false; }
	return playerList[_index].ready;
}

/// @self obj_device_handler
function get_all_players_ready ()
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if not playerList[_i].ready then return false;
	}
	return true;
}

/// @self obj_device_handler
function make_player_ready (_steamID, _readyState = true)
{
	var _index = get_index_by_player_id(_steamID);
	
	if _index == -1 then { show_debug_message("Target to change ready status not found..."); return; }
	playerList[_index].ready = _readyState;
}

/// @self obj_device_handler
function get_team_full (_team)
{
	if _team = Team.None then return false;
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if playerList[_i].team == _team return true;
	}
	return false;
}

/// @self obj_device_handler
function make_player_join_team (_steamID, _team)
{
	var _index = get_index_by_player_id(_steamID);
	
	if _index == -1 then { show_debug_message("Target to join team not found..."); return; }
	playerList[_index].team = _team;
}

/// @self obj_device_handler
function get_player_spectating (_steamID)
{
	var _index = get_index_by_player_id(_steamID);
	
	if _index == -1 then { show_debug_message("Target to get spectating status not found..."); return true; }
	return playerList[_index].team == Team.None;
}

/// @self obj_device_handler
function get_num_non_spectators ()
{
	var _numNonSpectators = 0;
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if playerList[_i].team != Team.None then _numNonSpectators++;
	}
	return _numNonSpectators;
}

/// @self obj_device_handler
function get_ids_of_non_spectators ()
{
	var _nonSpectators = [];
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		var _player = playerList[_i];
		if _player.team != Team.None then array_push(_nonSpectators, _player.steamID);
	}
	if array_length(_nonSpectators) == 2 then return _nonSpectators;
	
	show_debug_message("More or less than 2 non spectators were found...");
	return [0, 0];
}