switch async_load[?"event_type"]
{
	case "lobby_chat_update":
		var _fromID = async_load[?"user_id"];
		var _fromName = steam_get_user_persona_name_sync(_fromID);
		
		if async_load[?"change_flags"] & steam_lobby_member_change_entered
		{
			show_debug_message("Player Joined: " + _fromName);
			
			for (var _i = 0; _i < array_length(playerList); _i++)
			{
				var _playerID = playerList[_i].steamID;
				
				if _playerID == steamID then continue;
				if playerList[_i].team = Team.None then continue;
				
				make_player_ready(_playerID, false);
			}
			
			var _playerVar = get_player_var();
			_playerVar.steamID = _fromID;
			_playerVar.steamName = _fromName;
			
			array_push(playerList, _playerVar);
			
			send_player_sync_accept();
			break;
		}
		
		if async_load[?"change_flags"] & steam_lobby_member_change_left
		{
			show_debug_message("Player left: " + _fromName);
			
			var _playerIndex = get_index_by_player_id(_fromID);
			array_delete(playerList, _playerIndex, 1);
			
			send_player_sync_accept();
			break;
		}
	break;
}