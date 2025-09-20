global.bytes_per_player_var = 10;
global.bytes_per_creature_var = 61;



/// @desc Returns player dictionary of buffer length 10
function get_lobby_player_var ()
{
	var _player =
	{
		steamID : 0, // 8
		steamName : "Player",
		ready : true, // 1
		team : Team.None, // 1
	};
	return _player;
}

/// @desc Returns creature dictionary of buffer length 61
function get_combat_creature_var ()
{
	var _creature =
	{
		identifier : Creature.None, // 1
		modelInst : noone,
		iconInst : noone,
		X : 0, // 2
		Y : 0, // 2
		hp : 0, // 2
		moveTime : 0, // 4
		status : get_creature_status_var(),
		move1 : get_creature_move_var(),
		move2 : get_creature_move_var(),
		move3 : get_creature_move_var(),
		move4 : get_creature_move_var(),
		passiveAbility1 : PassiveAbility.None, // 1
		passiveAbility2 : PassiveAbility.None, // 1
		passiveAbility3 : PassiveAbility.None, // 1
		activeAbility : get_creature_active_ability_var(),
	};
	return _creature;
}

/// @desc Returns status dictionary of buffer length 21
function get_creature_status_var ()
{
	var _status =
	{
		stunned : { active : false, endTime : 0, }, // 1+4
		airborne : { active : false, endTime : 0, }, // 1+4
		rooted : { active : false, endTime : 0, }, // 1+4
		poisoned : { active : false, endTime : 0, damageTick : 0, }, // 1+4+1
	};
	return _status;
}

/// @desc Returns move dictionary of buffer length 5
function get_creature_move_var ()
{
	var _move =
	{
		identifier : Move.None, // 1
		restoreTime : 0, // 4
	};
	return _move;
}

/// @desc Returns active ability dictionary of buffer length 6
function get_creature_active_ability_var ()
{
	var _activeAbility =
	{
		identifier : ActiveAbility.None, // 1
		restoreTime : 0, // 4
		uses : 0, // 1
	};
	return _activeAbility;
}

function get_combat_move_var ()
{
	var _move =
	{
		identifier : Move.None,
		ID : 0,
		creatorCreature : CombatCreature.None,
		creatorMoveID : 0,
		creationTime : 0,
		inst : noone,
		
		initStats :
		{
			X : 0,
			Y : 0,
			direction : 0,
		},
		currStats :
		{
			X : 0,
			Y : 0,
			direction : 0,
		},
	};
	return _move;
}

function get_event_var ()
{
	var _event =
	{
		identifier : Event.None,
		time : 0,
		priority : 0,
		details : undefined,
	}
	return _event;
}