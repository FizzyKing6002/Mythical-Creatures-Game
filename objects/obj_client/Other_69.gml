switch async_load[?"event_type"]
{
	case "lobby_joined":
		hostID = steam_lobby_get_owner_id();
		show_debug_message("Joined lobby.");
	break;
	
	case "lobby_chat_update":
		var _fromID = async_load[?"user_id"];
		var _fromName = steam_get_user_persona_name_sync(_fromID);
		
		if ( async_load[?"change_flags"] & steam_lobby_member_change_left ) && _fromID == hostID
		{
			show_debug_message("Host player left, terminating lobby.");
			
			global.is_game_restarting = true;
			game_restart();
		}
}