function init_moves ()
{
	var get_move_template = function ()
	{
		var _moveTemplate =
		{
			displayName : "Move",
			cooldown : 0,
			castTime : 0,
			deploy : DeployMethod.None,
			shape : MoveShape.None,
			size : 0,
			thickness : 0,
			duration : 0,
			speed : 0,
			
			events :
			{
				atCreation : [],
				atTime : [],
				atDistance : [],
				onInvoke : [],
				onContact : [],
				onKill : [],
			},
			
			otherStats : [],
			recordedStats : [],
		};
		
/*		var _moveTemplate2 =
		{
			displayName : "Move",
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
			shape :
			{
				type : MoveShape.None,
				borderOnly : false,
				thickness : 0,
				size : 0,
			},
			speed :
			{
				max : 0,
				interpolation : undefined,
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
			damage :
			{
				gradient : AreaGradient.None,
				max : 0,
				gradientInterpolation : undefined,
				durationInterpolation : undefined,
			},
			invoke :
			{
				delay : 0,
				index : 0,
			}
		};*/
		
		return _moveTemplate;
	}
	
	var get_status_template = function ()
	{
		var _statusTemplate =
		{
			condition : StatusCondition.None,
			duration : 0,
			strength : 0,
		};
		return _statusTemplate;
	}
	
	
	
	global.fireball = get_move_template();
	global.fireball.cooldown = 3000;
	global.fireball.castTime = 250;
	global.fireball.deploy = DeployMethod.CentreDirect;
	global.fireball.shape = MoveShape.Circle;
	global.fireball.size = 15;
	global.fireball.duration = 2000;
	global.fireball.speed = 50;
}