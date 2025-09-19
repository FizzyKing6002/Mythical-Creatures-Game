while (steam_net_packet_receive())
{
	var _senderID = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	
	var _packetType = buffer_read(inbuf, buffer_u8);
	switch _packetType
	{
		case PacketType.PlayerSyncRequest:
			handle_player_sync_request(_senderID, inbuf);
		break;
		
		case PacketType.PlayerReadyRequest:
			handle_player_ready_request(_senderID, inbuf);
		break;
		
		case PacketType.PlayerJoinTeamRequest:
			handle_player_join_team_request(_senderID, inbuf);
		break;
		
		case PacketType.PlayerPartySelectNextRequest:
			handle_player_party_select_next_request(_senderID, inbuf);
		break;
		
		case PacketType.PlayerPartySelectCreatureRequest:
			handle_player_party_select_creature_request(_senderID, inbuf);
		break;
		
		default:
			show_debug_message("Server received unknown packet: " + string(_packetType));
		break;
	}
}



if room != rm_combat || is_creature_turn() then exit;

var _currentTime = current_time;
var _nextCombatTime = combatData.combatTime + _currentTime - combatData.actualTime;
var _nextStepTime = round_to_next_combat_step_time(combatData.combatTime);
combatData.actualTime = _currentTime;

evaluate_events(_nextStepTime - global.combatStepTime);

for (var _time = _nextStepTime; _time <= _nextCombatTime; _time += global.combatStepTime)
{
	show_debug_message("Event loop at: " + string(_time))
	add_creature_events(_time);
	add_move_events(_time);
	
	if evaluate_events(_time) then exit;
}

combatData.combatTime = _nextCombatTime;