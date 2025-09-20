function get_move_curr_position (_move, _data, _time)
{
	var _speed = _data.speed;
	var _direction = _move.initStats.direction;
	var _creationTime = _move.creationTime;
	
	var _xSpeed = lengthdir_x(_speed, _direction);
	var _ySpeed = lengthdir_y(_speed, _direction);
	var _timeDiff = _time - _creationTime;
	
	var _x = _move.initStats.X + _xSpeed * _timeDiff / 1000;
	var _y = _move.initStats.Y + _ySpeed * _timeDiff / 1000;
	
	return { X:_x, Y:_y };
}