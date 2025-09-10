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
		_player.steamID = _steamID;
		_player.steamName = _steamName;
		_player.ready = _readyBool;
		_player.team = _team;
		
		playerList[_playerIndex] = _player;
	}
}

/// @self obj_client
function handle_combat_sync_accept (_b)
{
	var _partySelectStage = buffer_read(_b, buffer_u8);
	var _blueID = buffer_read(_b, buffer_u64);
	var _redID = buffer_read(_b, buffer_u64);
	var _blueBenchNum = buffer_read(_b, buffer_u8);
	var _redBenchNum = buffer_read(_b, buffer_u8);
	combatData.partySelectStage = _partySelectStage;
	combatData.blueID = _blueID;
	combatData.redID = _redID;
	combatData.blueBenchNum = _blueBenchNum;
	combatData.redBenchNum = _redBenchNum;
	
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
			default: show_debug_message("Ninth creature not accounted for..."); continue;
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
	
	if _team == Team.None or _steamID == hostID then make_player_ready(_steamID, true);
	else make_player_ready(_steamID, false);
	make_player_join_team(_steamID, _team);
}

/// @self obj_client
function handle_party_select_start_event (_b)
{
	room_goto(rm_party_select);
	fill_ids_of_team_players();
}

/// @self obj_client
function handle_party_select_timeout_event (_b)
{
	var _creature = buffer_read(_b, buffer_u8);
	
	if _creature != Creature.None then change_current_creature(_creature);
	next_party_select_stage();
}

/// @self obj_client
function handle_player_party_select_next_accept (_b)
{
	next_party_select_stage();
}

/// @self obj_client
function handle_player_party_select_creature_accept (_b)
{
	var _creature = buffer_read(_b, buffer_u8);
	
	change_current_creature(_creature);
}

/// @self obj_client
function handle_combat_start_event (_b)
{
	room_goto(rm_combat);
}