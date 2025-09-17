/// @self obj_client
function buffer_create_player_sync_request ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerSyncRequest);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_sync_accept ()
{
	var _b = buffer_create(1 + array_length(playerList)*global.bytes_per_player_var, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerSyncAccept);
	
	for (var _playerIndex = 0; _playerIndex < array_length(playerList); _playerIndex++)
	{
		var _player = playerList[_playerIndex];
		
		buffer_write(_b, buffer_u64, _player.steamID);
		buffer_write(_b, buffer_u8, _player.ready);
		buffer_write(_b, buffer_u8, _player.team);
	}
	
	return _b;
}

/// @self obj_server
function buffer_create_combat_sync_accept ()
{
	var _b = buffer_create(25 + 8*global.bytes_per_creature_var, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.CombatSyncAccept);
	buffer_write(_b, buffer_u8, combatData.partySelectStage);
	buffer_write(_b, buffer_u8, combatData.map);
	buffer_write(_b, buffer_u32, combatData.combatTime);
	buffer_write(_b, buffer_u64, combatData.blueID);
	buffer_write(_b, buffer_u64, combatData.redID);
	buffer_write(_b, buffer_u8, combatData.blueBenchCreature);
	buffer_write(_b, buffer_u8, combatData.redBenchCreature);
	
	for (var _creatureIndex = 0; _creatureIndex < 8; _creatureIndex++)
	{
		var _creature = undefined;
		switch _creatureIndex
		{
			case 0: _creature = combatData.blueCreature1; break;
			case 1: _creature = combatData.blueCreature2; break;
			case 2: _creature = combatData.blueCreature3; break;
			case 3: _creature = combatData.blueCreature4; break;
			case 4: _creature = combatData.redCreature1; break;
			case 5: _creature = combatData.redCreature2; break;
			case 6: _creature = combatData.redCreature3; break;
			case 7: _creature = combatData.redCreature4; break;
			default: show_debug_message("Ninth creature not found..."); break;
		}
		
		buffer_write(_b, buffer_u8, _creature.identifier);
		buffer_write(_b, buffer_u16, _creature.X);
		buffer_write(_b, buffer_u16, _creature.Y);
		buffer_write(_b, buffer_u16, _creature.hp);
		buffer_write(_b, buffer_u32, _creature.moveTime);
		buffer_write(_b, buffer_u8, _creature.passiveAbility1);
		buffer_write(_b, buffer_u8, _creature.passiveAbility2);
		buffer_write(_b, buffer_u8, _creature.passiveAbility3);
		
		var _activeAbility = _creature.activeAbility;
		buffer_write(_b, buffer_u8, _activeAbility.identifier);
		buffer_write(_b, buffer_u32, _activeAbility.restoreTime);
		buffer_write(_b, buffer_u8, _activeAbility.uses);
		
		var _status = _creature.status;
		buffer_write(_b, buffer_u8, _status.stunned.active);
		buffer_write(_b, buffer_u32, _status.stunned.endTime);
		buffer_write(_b, buffer_u8, _status.airborne.active);
		buffer_write(_b, buffer_u32, _status.airborne.endTime);
		buffer_write(_b, buffer_u8, _status.rooted.active);
		buffer_write(_b, buffer_u32, _status.rooted.endTime);
		buffer_write(_b, buffer_u8, _status.poisoned.active);
		buffer_write(_b, buffer_u32, _status.poisoned.endTime);
		buffer_write(_b, buffer_u8, _status.poisoned.damageTick);
		
		for (var _moveIndex = 0; _moveIndex < 4; _moveIndex++)
		{
			var _move = undefined;
			switch _moveIndex
			{
				case 0: _move = _creature.move1; break;
				case 1: _move = _creature.move2; break;
				case 2: _move = _creature.move3; break;
				case 3: _move = _creature.move4; break;
				default: show_debug_message("Fifth move not found..."); break;
			}
			
			buffer_write(_b, buffer_u8, _move.identifier);
			buffer_write(_b, buffer_u32, _move.restoreTime);
		}
	}
	
	return _b;
}

/// @self obj_client
function buffer_create_player_ready_request (_state)
{
	var _b = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyRequest);
	buffer_write(_b, buffer_u8, _state);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_ready_accept (_steamID, _state)
{
	var _b = buffer_create(10, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyAccept);
	buffer_write(_b, buffer_u64, _steamID);
	buffer_write(_b, buffer_u8, _state);
	
	return _b;
}

/// @self obj_client
function buffer_create_player_join_team_request (_team)
{
	var _b = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerJoinTeamRequest);
	buffer_write(_b, buffer_u8, _team);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_join_team_accept (_steamID, _team)
{
	var _b = buffer_create(10, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerJoinTeamAccept);
	buffer_write(_b, buffer_u64, _steamID);
	buffer_write(_b, buffer_u8, _team);
	
	return _b;
}

/// @self obj_server
function buffer_create_party_select_start_event ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PartySelectStartEvent);
	
	return _b;
}

/// @self obj_client
function buffer_create_party_select_timeout_event (_creature)
{
	var _b = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PartySelectTimeoutEvent);
	buffer_write(_b, buffer_u8, _creature);
	
	return _b;
}

/// @self obj_client
function buffer_create_player_party_select_next_request ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerPartySelectNextRequest);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_party_select_next_accept ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerPartySelectNextAccept);
	
	return _b;
}

/// @self obj_client
function buffer_create_player_party_select_creature_request (_creature)
{
	var _b = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerPartySelectCreatureRequest);
	buffer_write(_b, buffer_u8, _creature);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_party_select_creature_accept (_creature)
{
	var _b = buffer_create(2, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerPartySelectCreatureAccept);
	buffer_write(_b, buffer_u8, _creature);
	
	return _b;
}

/// @self obj_server
function buffer_create_combat_start_event ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.CombatStartEvent);
	
	return _b;
}