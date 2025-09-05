/// @self obj_client
function handle_player_sync_accept (_b)
{
	var _b_size = buffer_get_size(_b);
	var _num_players = _b_size div get_bytes_per_player_var();
	
	playerList = [];
	
	for (var _playerIndex = 0; _playerIndex < _num_players; _playerIndex++)
	{
		var _player = get_player_var();
		
		var _steamID = buffer_read(_b, buffer_u64);
		var _steamName = steam_get_user_persona_name_sync(_steamID);
		var _readyNum = buffer_read(_b, buffer_u8);
		var _readyBool = _readyNum != 0;
		var _team = buffer_read(_b, buffer_u8);
		var _benchNum = buffer_read(_b, buffer_u8);
		_player.steamID = _steamID;
		_player.steamName = _steamName;
		_player.ready = _readyBool;
		_player.team = _team;
		_player.benchNum = _benchNum;
		
		for (var _creatureIndex = 0; _creatureIndex < 4; _creatureIndex++)
		{
			var _creature = undefined;
			switch _creatureIndex
			{
				case 0: _creature = _player.creature1; break;
				case 1: _creature = _player.creature2; break;
				case 2: _creature = _player.creature3; break;
				case 3: _creature = _player.creature4; break;
				default: show_debug_message("Fifth creature not accounted for..."); continue;
			}
			
			var _identifierNum = buffer_read(_b, buffer_u8);
			var _identifierBool = _identifierNum != 0;
			var _xPos = buffer_read(_b, buffer_u16);
			var _yPos = buffer_read(_b, buffer_u16);
			var _moveTime = buffer_read(_b, buffer_u32);
			var _passiveAbility1 = buffer_read(_b, buffer_u8);
			var _passiveAbility2 = buffer_read(_b, buffer_u8);
			var _passiveAbility3 = buffer_read(_b, buffer_u8);
			_creature.identifier = _identifierBool;
			_creature.xPos = _xPos;
			_creature.yPos = _yPos;
			_creature.moveTime = _moveTime;
			_creature.passiveAbility1 = _passiveAbility1;
			_creature.passiveAbility2 = _passiveAbility2;
			_creature.passiveAbility3 = _passiveAbility3;
			
			
			var _activeAbility = _creature.activeAbility;
			
			_identifierNum = buffer_read(_b, buffer_u8);
			_identifierBool = _identifierNum != 0;
			var _restoreTime = buffer_read(_b, buffer_u32);
			var _uses = buffer_read(_b, buffer_u8);
			_activeAbility.identifier = _identifierBool;
			_activeAbility.restoreTime = _restoreTime;
			_activeAbility.uses = _uses;
			
			
			var _status = _creature.status;
			
			var _activeNum = buffer_read(_b, buffer_u8);
			var _activeBool = _activeNum != 0;
			var _endTime = buffer_read(_b, buffer_u32);
			_status.stunned.active = _activeBool;
			_status.stunned.endTime = _endTime;
			
			_activeNum = buffer_read(_b, buffer_u8);
			_activeBool = _activeNum != 0;
			_endTime = buffer_read(_b, buffer_u32);
			_status.airborne.active = _activeBool;
			_status.airborne.endTime = _endTime;
			
			_activeNum = buffer_read(_b, buffer_u8);
			_activeBool = _activeNum != 0;
			_endTime = buffer_read(_b, buffer_u32);
			_status.rooted.active = _activeBool;
			_status.rooted.endTime = _endTime;
			
			_activeNum = buffer_read(_b, buffer_u8);
			_activeBool = _activeNum != 0;
			_endTime = buffer_read(_b, buffer_u32);
			var _damageTick = buffer_read(_b, buffer_u8);
			_status.poisoned.active = _activeBool;
			_status.poisoned.endTime = _endTime;
			_status.poisoned.damageTick = _damageTick;
			
			
			for (var _moveIndex = 0; _moveIndex < 4; _moveIndex++)
			{
				var _move = undefined;
				switch _moveIndex
				{
					case 0: _move = _creature.move1; break;
					case 1: _move = _creature.move2; break;
					case 2: _move = _creature.move3; break;
					case 3: _move = _creature.move4; break;
					default: show_debug_message("Fifth move not accounted for..."); continue;
				}
				
				_identifierNum = buffer_read(_b, buffer_u8);
				_identifierBool = _identifierNum != 0;
				_restoreTime = buffer_read(_b, buffer_u32);
				_move.identifier = _identifierBool;
				_move.restoreTime = _restoreTime;
			}
		}
		
		playerList[_playerIndex] = _player;
	}
}

/// @self obj_client
function handle_player_ready_accept (_b)
{
	var _steamID = buffer_read(_b, buffer_u64);
	var _stateNum = buffer_read(_b, buffer_u8);
	var _stateBool = _stateNum != 0;
	
	make_player_ready(_steamID, _stateBool);
}

/// @self obj_client
function handle_player_join_team_accept (_b)
{
	var _steamID = buffer_read(_b, buffer_u64);
	var _team = buffer_read(_b, buffer_u8);
	
	make_player_join_team(_steamID, _team);
}

/// @self obj_client
function handle_combat_start_event (_b)
{
	room_goto(rm_combat);
}