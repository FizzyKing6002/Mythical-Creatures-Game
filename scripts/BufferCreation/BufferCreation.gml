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
	var _b = buffer_create(1 + get_bytes_per_player_var()*array_length(playerList), buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerSyncAccept);
	for (var _playerIndex = 0; _playerIndex < array_length(playerList); _playerIndex++)
	{
		var _player = playerList[_playerIndex];
		
		buffer_write(_b, buffer_u64, _player.steamID);
		buffer_write(_b, buffer_u8, _player.ready);
		
		for (var _creatureIndex = 0; _creatureIndex < 4; _creatureIndex++)
		{
			var _creature = _player.creature1;
			switch _creatureIndex
			{
				case 0: break;
				case 1: _creature = _player.creature2; break;
				case 2: _creature = _player.creature3; break;
				case 3: _creature = _player.creature4; break;
				default: show_debug_message("Fifth creature not found..."); break;
			}
			
			buffer_write(_b, buffer_u8, _creature.identifier);
			buffer_write(_b, buffer_u16, _creature.x);
			buffer_write(_b, buffer_u16, _creature.y);
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
				var _move = _creature.move1;
				switch _moveIndex
				{
					case 0: break;
					case 1: _move = _creature.move2; break;
					case 2: _move = _creature.move3; break;
					case 3: _move = _creature.move4; break;
					default: show_debug_message("Fifth move not found..."); break;
				}
				
				buffer_write(_b, buffer_u8, _move.identifier);
				buffer_write(_b, buffer_u32, _move.restoreTime);
			}
		}
	}
	
	return _b;
}

/// @self obj_client
function buffer_create_player_ready_request ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyRequest);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_ready_accept (_steamID)
{
	var _b = buffer_create(9, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyAccept);
	buffer_write(_b, buffer_u64, _steamID);
	
	return _b;
}

/// @self obj_server
function buffer_create_game_start ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.GameStart);
	
	return _b;
}