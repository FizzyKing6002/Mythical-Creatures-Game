/// @self obj_local_host
function evaluate_moves (_time)
{
	var _moves = combatData.moves;
	var _timeDiff = global.combatStepTime;
	
	for (var _i = 0; _i < array_length(_moves); _i++)
	{
		var _move = _moves[_i];
		var _data = get_move_data(_move.identifier);
		
		do_move_motion(_move, _data, _timeDiff);
	}
}

function do_move_motion (_move, _data, _timeDiff)
{
	var _speed = _data.speed;
	var _direction = _move.direction;
	
	var _xSpeed = lengthdir_x(_speed, _direction);
	var _ySpeed = lengthdir_y(_speed, _direction);
	
	_move.X += _xSpeed * _timeDiff / 1000;
	_move.Y += _ySpeed * _timeDiff / 1000;
}