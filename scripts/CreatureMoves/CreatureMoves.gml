var _moveTemplate =
{
	duration : 0,
	timeCost : 0,
	status : [],
	
	deploy :
	{
		method : DeployMethod.None,
		delay : 0,
		duration : 0,
		interpolation : undefined,
	},
	damage :
	{
		gradient : AreaGradient.None,
		max : 0,
		gradientInterpolation : undefined,
		durationInterpolation : undefined,
	},
	shape :
	{
		type : MoveShape.None,
		borderOnly : false,
		thickness : 0,
		size : 0,
	},
	grow :
	{
		enabled : false,
		delay : 0,
		duration : 0,
		multiplier : 1,
		interpolation : undefined,
	},
	direction :
	{
		addPlayerSelection : false,
		addCreatureFacing : false,
		offset : 0,
		interpolation : undefined,
	},
	speed :
	{
		max : 0,
		interpolation : undefined,
	},
	invoke :
	{
		delay : 0,
		index : 0,
	}
};

var _statusTemplate =
{
	condition : StatusCondition.None,
	duration : 0,
	strength : 0,
};



global.fireball = [_moveTemplate];
global.fireball[0].deployTime = 500;
global.fireball[0].shape = MoveShape.Circle;
global.fireball[0].size = 15;