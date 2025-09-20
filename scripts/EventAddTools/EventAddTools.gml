/// @self obj_local_host
function array_push_event_in_order (_event)
{
	var _events = combatData.events;
	var _len = array_length(_events);
	var _index = binary_search_by_field_greater(_events, "time", _event.time);
	
	while _index != _len && _event.time == _events[_index].time
	{
		if _event.priority >= _events[_index].priority then break;
		
		_index++;
	}
	
	array_insert(_events, _index, _event);
}

/// @self obj_local_host
function event_add_creature_turn (_creature, _data, _time, _combatCreature)
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
function event_add_create_move (_identifier, _deployMethod, _clicks, _creatorCreature, _creatorMoveID, _time)
{
	var _deployData = get_deploy_data_by_method(_deployMethod, _clicks, _creatorCreature, _creatorMoveID);
	
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
	
	array_push_event_in_order(_event);
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
	var _position = get_move_curr_position(_move, _data, _time);
	
	var _event = get_event_var();
	
	_event.identifier = Event.MoveMove;
	_event.time = _time;
	_event.priority = global.eventPriorityMoveMove;
	_event.details =
	{
		target : _move.ID,
		X : _position.X,
		Y : _position.X,
	};
	
	array_push_event_in_order(_event);
}