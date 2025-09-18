/// @self obj_local_host
function add_event_creature_turn (_creature, _data, _time)
{
	var _creatureMoveTime = _creature.moveTime;
	
	if _creatureMoveTime > _time then return;
	
	var _event = get_event_var();
	
	_event.identifier = Event.CreatureTurn;
	_event.time = _creatureMoveTime;
	_event.priority = global.eventPriorityCreatureTurn - _data.speed;
	_event.details = { target : _combatCreature };
	
	array_push(combatData.events, _event);
}

/// @self obj_local_host
function add_event_destroy_move (_move, _data, _time)
{
	var _expiryTime = _data.duration + _move.creationTime;
	
	if _expiryTime > _time then return;
	
	var _event = get_event_var();
	
	_event.identifier = Event.DestroyMove;
	_event.time = _expiryTime;
	_event.priority = global.eventPriorityDestroyMove;
	_event.details = { target : _move.ID };
	
	array_push(combatData.events, _event);
}

/// @self obj_local_host
function add_event_move_move (_move, _data, _time)
{
	var _speed = _data.speed;
	var _direction = _move.direction;
	
	var _xSpeed = lengthdir_x(_speed, _direction);
	var _ySpeed = lengthdir_y(_speed, _direction);
	
	var _x = _move.X + _xSpeed * global.combatStepTime / 1000;
	var _y = _move.Y + _ySpeed * global.combatStepTime / 1000;
	
	var _event = get_event_var();
	
	_event.identifier = Event.MoveMove;
	_event.time = _time;
	_event.priority = global.eventPriorityMoveMove;
	_event.details =
	{
		target : _move.ID,
		X : _x,
		Y : _y,
	};
	
	array_push(combatData.events, _event);
}