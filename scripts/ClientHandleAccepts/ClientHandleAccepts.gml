/// @self obj_client
function handle_player_sync_accept (_b)
{
	var _b_size = buffer_get_size(_b);
	var _num_players = _b_size div get_bytes_per_player_var();
	playerList = [];
	
	for (var _playerIndex = 0; _playerIndex < _num_players; _playerIndex++)
	{
		var _playerVar = get_player_var();
		
		var _steamID = buffer_read(_b, buffer_u64);
		var _steamName = steam_get_user_persona_name_sync(_steamID);
		var _readyNum = buffer_read(_b, buffer_u8);
		var _readyBool = _readyNum != 0;
		_playerVar.steamID = _steamID;
		_playerVar.steamName = _steamName;
		_playerVar.ready = _readyBool;
		
		for (var _creatureIndex = 0; _creatureIndex < 4; _creatureIndex++)
		{
			var _creatureVar = get_creature_var();
			
			var _identifierNum = buffer_read(_b, buffer_u8);
			var _identifierBool = _identifierNum != 0;
			var _x = buffer_read(_b, buffer_u16);
			var _y = buffer_read(_b, buffer_u16);
			var _moveTime = buffer_read(_b, buffer_u32);
			var _passiveAbility1 = buffer_read(_b, buffer_u8);
			var _passiveAbility2 = buffer_read(_b, buffer_u8);
			var _passiveAbility3 = buffer_read(_b, buffer_u8);
			_creatureVar.identifier = _identifierBool;
			_creatureVar.x = _x;
			_creatureVar.y = _y;
			_creatureVar.moveTime = _moveTime;
			_creatureVar.passiveAbility1 = _passiveAbility1;
			_creatureVar.passiveAbility2 = _passiveAbility2;
			_creatureVar.passiveAbility3 = _passiveAbility3;
			
			
			var _activeAbilityVar = get_active_ability_var();
			
			_identifierNum = buffer_read(_b, buffer_u8);
			_identifierBool = _identifierNum != 0;
			var _restoreTime = buffer_read(_b, buffer_u32);
			var _uses = buffer_read(_b, buffer_u8);
			_activeAbilityVar.identifier = _identifierBool;
			_activeAbilityVar.restoreTime = _restoreTime;
			_activeAbilityVar.uses = _uses;
			
			_creatureVar.activeAbility = _activeAbilityVar;
			
			
			var _statusVar = get_status_var();
			
			var _activeNum = buffer_read(_b, buffer_u8);
			var _activeBool = _activeNum != 0;
			var _endTime = buffer_read(_b, buffer_u32);
			_statusVar.stunned.active = _activeBool;
			_statusVar.stunned.endTime = _endTime;
			
			_activeNum = buffer_read(_b, buffer_u8);
			_activeBool = _activeNum != 0;
			_endTime = buffer_read(_b, buffer_u32);
			_statusVar.airborne.active = _activeBool;
			_statusVar.airborne.endTime = _endTime;
			
			_activeNum = buffer_read(_b, buffer_u8);
			_activeBool = _activeNum != 0;
			_endTime = buffer_read(_b, buffer_u32);
			_statusVar.rooted.active = _activeBool;
			_statusVar.rooted.endTime = _endTime;
			
			_activeNum = buffer_read(_b, buffer_u8);
			_activeBool = _activeNum != 0;
			_endTime = buffer_read(_b, buffer_u32);
			var _damageTick = buffer_read(_b, buffer_u8);
			_statusVar.poisoned.active = _activeBool;
			_statusVar.poisoned.endTime = _endTime;
			_statusVar.poisoned.damageTick = _damageTick;
			
			_creatureVar.status = _statusVar;
			
			
			for (var _moveIndex = 0; _moveIndex < 4; _moveIndex++)
			{
				var _moveVar = get_move_var();
				
				_identifierNum = buffer_read(_b, buffer_u8);
				_identifierBool = _identifierNum != 0;
				_restoreTime = buffer_read(_b, buffer_u32);
				_moveVar.identifier = _identifierBool;
				_moveVar.restoreTime = _restoreTime;
				
				switch _moveIndex
				{
					case 0: _creatureVar.move1 = _moveVar; break;
					case 1: _creatureVar.move2 = _moveVar; break;
					case 2: _creatureVar.move3 = _moveVar; break;
					case 3: _creatureVar.move4 = _moveVar; break;
					default: show_debug_message("Fifth move not accounted for..."); break;
				}
			}
			
			
			switch _creatureIndex
			{
				case 0: _playerVar.creature1 = _creatureVar; break;
				case 1: _playerVar.creature2 = _creatureVar; break;
				case 2: _playerVar.creature3 = _creatureVar; break;
				case 3: _playerVar.creature4 = _creatureVar; break;
				default: show_debug_message("Fifth creature not accounted for..."); break;
			}
		}
		
		playerList[_playerIndex] = _playerVar;
	}
	
	lobbyIndex = get_index_by_player_id(steamID);
	
	show_debug_message(playerList);
}

/// @self obj_client
function handle_player_ready_accept (_b)
{
	var _readyID = buffer_read(_b, buffer_u64);
	make_player_ready(_readyID);
}

/// @self obj_client
function handle_game_start (_b)
{
	room_goto(rm_game);
}