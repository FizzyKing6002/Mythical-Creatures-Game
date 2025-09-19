/// @self obj_local_host
function array_push_event_in_order (_event)
{
	var _events = combatData.events;
	var _index = binary_search_by_field_greater(_events, "time", _event.time);
	
	while _event.time == _events[_index].time
	{
		if _event.priority >= _events[_index].priority then break;
		
		_index++;
	}
	
	array_insert(_events, _index, _event);
}

/// @self obj_local_host
function event_add_creature_turn (_creature, _data, _time)
{
	var _creatureMoveTime = _creature.moveTime;
	
	if _creatureMoveTime > _time then return;
	
	var _event = get_event_var();
	
	_event.identifier = Event.CreatureTurn;
	_event.time = _creatureMoveTime;
	_event.priority = global.eventPriorityCreatureTurn - _data.speed;
	_event.details = { target : _combatCreature };
	
	array_push_event_in_order(_event);
}

/// @self obj_local_host
function event_add_create_move (_identifier, _creatorCreature, _creatorMoveID, _time)
{
	var _deployData = get_deploy_data_by_method(DeployMethod.CentreDirect, [{ X:320, Y:180 }], _creatorCreature, _creatorMoveID);
	
	var _event = get_event_var();
	
	_event.identifier = Event.CreateMove;
	_event.time = _time;
	_event.priority = global.eventPriorityCreateMove;
	_event.details =
	{
		target : _identifier,
		deployData : _deployData,
		creatorCreature : _creatorCreature,
		creatorMoveID : _creatorMoveID,
	};
}

/// @self obj_local_host
function event_add_destroy_move (_move, _data, _time)
{
	var _expiryTime = _data.duration + _move.creationTime;
	
	if _expiryTime > _time then return;
	
	var _event = get_event_var();
	
	_event.identifier = Event.DestroyMove;
	_event.time = _expiryTime;
	_event.priority = global.eventPriorityDestroyMove;
	_event.details = { target : _move.ID };
	
	array_push_event_in_order(_event);
}

/// @self obj_local_host
function event_add_move_move (_move, _data, _time)
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
	
	array_push_event_in_order(_event);
}