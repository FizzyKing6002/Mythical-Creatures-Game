function event_perform_creature_turn (_details)
{
	var _target = _details.target;
	
	combatData.creatureTurn = _target;
}

function event_perform_create_move (_details, _time)
{
	var _target = _details.target;
	var _deployData = _details.deployData;
	var _creatorCreature = _details.creatorCreature;
	var _creatorMoveID = _details.creatorMoveID;
	
	var _combatMove = get_combat_move_var();
	var _data = get_move_data(_target);
	
	_combatMove.identifier = _target;
	_combatMove.ID = combatData.nextMoveID;
	combatData.nextMoveID++;
	_combatMove.creatorCreature = _creatorCreature;
	_combatMove.creatorMoveID = _creatorMoveID;
	_combatMove.creationTime = _time;
	_combatMove.initStats.X = _deployData.X;
	_combatMove.initStats.Y = _deployData.Y;
	_combatMove.initStats.direction = _deployData.direction;
	
	_combatMove.currStats.X = _combatMove.initStats.X;
	_combatMove.currStats.Y = _combatMove.initStats.Y;
	_combatMove.currStats.direction = _combatMove.initStats.direction;
	
	var _moveSprite = get_move_sprite_by_identifier(_target);
	var _moveLayer = layer_get_id("Moves");
	var _moveInst = instance_create_layer(0, 0, _moveLayer, obj_move);
	
	_moveInst.sprite_index = _moveSprite;
	_moveInst.image_xscale = _data.size / global.defaultMoveSize;
	_moveInst.image_yscale = _data.size / global.defaultMoveSize;
	_moveInst.move = _combatMove;
	_moveInst.moveData = get_move_data(_combatMove.identifier);
	
	_combatMove.inst = _moveInst;
	
	array_push(combatData.moves, _combatMove);
}

function event_perform_destroy_move (_details)
{
	var _target = _details.target;
	
	var _index = get_combat_move_index_from_id(_target);
	if _index == undefined then return;
	
	array_delete(combatData.moves, _index, 1);
}

function event_perform_move_move (_details)
{
	var _target = _details.target;
	var _x = _details.X;
	var _y = _details.Y;
	
	var _move = get_combat_move_from_id(_target);
	
	_move.currStats.X = _x;
	_move.currStats.Y = _y;
}