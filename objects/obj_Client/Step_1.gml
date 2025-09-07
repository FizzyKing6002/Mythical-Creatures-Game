while (steam_net_packet_receive())
{
	var _senderID = steam_net_packet_get_sender_id();
	if _senderID != hostID then { show_debug_message("Packet received from wrong ID: " + _senderID); continue; }
	
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	
	var _packetType = buffer_read(inbuf, buffer_u8);
	switch _packetType
	{
		case PacketType.PlayerSyncAccept:
			handle_player_sync_accept(inbuf);
		break;
		
		case PacketType.PlayerReadyAccept:
			handle_player_ready_accept(inbuf);
		break;
		
		case PacketType.PlayerJoinTeamAccept:
			handle_player_join_team_accept(inbuf);
		break;
		
		case PacketType.PartySelectStartEvent:
			handle_party_select_start_event(inbuf);
		break;
		
		case PacketType.PartySelectTimeoutEvent:
			handle_party_select_timeout_event(inbuf);
		break;
		
		case PacketType.PlayerPartySelectNextAccept:
			handle_player_party_select_next_accept(inbuf);
		break;
		
		case PacketType.PlayerPartySelectCreatureAccept:
			handle_player_party_select_creature_accept(inbuf);
		break;
		
		case PacketType.CombatStartEvent:
			handle_combat_start_event(inbuf);
		break;
		
		default:
			show_debug_message("Client received unknown packet: " + string(_packetType));
		break;
	}
}