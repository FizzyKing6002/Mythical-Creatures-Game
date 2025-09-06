/// @desc Returns player dictionary of buffer length 247
function get_player_var ()
{
	var _playerVar =
	{
		steamID : 0, // 8
		steamName : "Player",
		ready : true, // 1
		team : Team.None, // 1
		benchNum : 0, // 1
		creature1 : get_creature_var(),
		creature2 : get_creature_var(),
		creature3 : get_creature_var(),
		creature4 : get_creature_var(),
	}
	return _playerVar;
}

/// @desc Returns creature dictionary of buffer length 59
function get_creature_var ()
{
	var _creatureVar =
	{
		identifier : Creature.None, // 1
		modelInst : undefined,
		iconInst : undefined,
		xPos : 0, // 2
		yPos : 0, // 2
		moveTime : 0, // 4
		passiveAbility1 : PassiveAbility.None, // 1
		passiveAbility2 : PassiveAbility.None, // 1
		passiveAbility3 : PassiveAbility.None, // 1
		activeAbility : get_active_ability_var(),
		status : get_status_var(),
		move1 : get_move_var(),
		move2 : get_move_var(),
		move3 : get_move_var(),
		move4 : get_move_var(),
	}
	return _creatureVar;
}

/// @desc Returns status dictionary of buffer length 21
function get_status_var ()
{
	var _statusVar =
	{
		stunned : { active : false, endTime : 0, }, // 1+4
		airborne : { active : false, endTime : 0, }, // 1+4
		rooted : { active : false, endTime : 0, }, // 1+4
		poisoned : { active : false, endTime : 0, damageTick : 0, }, // 1+4+1
	}
	return _statusVar;
}

/// @desc Returns move dictionary of buffer length 5
function get_move_var ()
{
	var _moveVar =
	{
		identifier : Move.None, // 1
		restoreTime : 0, // 4
	}
	return _moveVar;
}

/// @desc Returns active ability dictionary of buffer length 6
function get_active_ability_var ()
{
	var _activeAbilityVar =
	{
		identifier : ActiveAbility.None, // 1
		restoreTime : 0, // 4
		uses : 0, // 1
	}
	return _activeAbilityVar;
}

function get_bytes_per_player_var ()
{
	return 247;
}