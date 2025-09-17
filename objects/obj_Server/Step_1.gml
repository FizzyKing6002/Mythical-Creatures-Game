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



if room != rm_combat or combatData.creatureTurn != CombatCreature.None then exit;

var _creatureTurnData = get_creature_turn_data();

if array_length(_creatureTurnData) == 0
{
	combatData.timeDiff = current_time - combatData.actualTime;
	combatData.combatTime += combatData.timeDiff;
	combatData.actualTime = current_time;
	
	evaluate_moves();
	exit;
}