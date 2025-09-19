/// @self obj_local_host
function get_deploy_data_by_method (_deployMethod, _clicks, _creatorCreature, _creatorMoveID)
{
	var _deployData =
	{
		X : 0,
		Y : 0,
		direction : 0,
	}
	
	var _creature = undefined;
	var _move = undefined;
	
	switch _deployMethod
	{
		case DeployMethod.Centre:
			if _creatorMoveID == -1
			{
				_creature = get_combat_creature_from_identifier(_creatorCreature);
				_deployData.X = _creature.X;
				_deployData.Y = _creature.Y;
				break;
			}
			_move = get_combat_move_from_id(_creatorMoveID);
			_deployData.X = _move.X;
			_deployData.Y = _move.Y;
		break;
		
		case DeployMethod.CentreDirect:
			if _creatorMoveID == -1
			{
				_creature = get_combat_creature_from_identifier(_creatorCreature);
				_deployData.X = _creature.X;
				_deployData.Y = _creature.Y;
				_deployData.direction = get_direction_between_points({ X:_creature.X, Y:_creature.Y }, _clicks[0]);
				break;
			}
			_move = get_combat_move_from_id(_creatorMoveID);
			_deployData.X = _move.X;
			_deployData.Y = _move.Y;
			_deployData.direction = get_direction_between_points({ X:_move.X, Y:_move.Y }, _clicks[0]);
		break;
		
		case DeployMethod.CentreRDirect:
			if _creatorMoveID == -1
			{
				_creature = get_combat_creature_from_identifier(_creatorCreature);
				_deployData.X = _creature.X;
				_deployData.Y = _creature.Y;
				_deployData.direction = irandom(360);
				break;
			}
			_move = get_combat_move_from_id(_creatorMoveID);
			_deployData.X = _move.X;
			_deployData.Y = _move.Y;
			_deployData.direction = irandom(360);
		break;
	}
	
	return _deployData;
}

function get_direction_between_points (_point1, _point2)
{
	return arctan2(_point2.Y - _point1.Y, _point2.X - _point1.X);
}