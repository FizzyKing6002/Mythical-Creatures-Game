/// @self obj_local_host
function handle_combat_start ()
{
	fill_spawn_coords_by_map(combatData.map);
	fill_creatures_init_values();
	spawn_creatures();
}

/// @self obj_local_host
function get_creature_turn_data ()
{
	var _creatureTurnData = [];
	
	for (var _combatCreature = 0; _combatCreature < CombatCreature.None; _combatCreature++)
	{
		var _creature = get_combat_creature_from_identifier(_combatCreature);
		var _creatureMoveTime = _creature.moveTime;
		var _creatureSpeed = get_creature_data(_creature.identifier).speed;
		
		if _creatureMoveTime > combatData.combatTime then continue;
		
		array_push(_creatureTurnData, [_combatCreature, _creatureMoveTime, _creatureSpeed]);
	}
	
	return _creatureTurnData;
}

/// @self obj_local_host
function fill_spawn_coords_by_map (_map)
{
	switch _map
	{
		case Map.Default:
			combatData.blueCreature1.X = 150;
			combatData.blueCreature1.Y = 100;
			combatData.blueCreature2.X = 120;
			combatData.blueCreature2.Y = 180;
			combatData.blueCreature3.X = 150;
			combatData.blueCreature3.Y = 260;
			combatData.redCreature1.X = 490;
			combatData.redCreature1.Y = 100;
			combatData.redCreature2.X = 520;
			combatData.redCreature2.Y = 180;
			combatData.redCreature3.X = 490;
			combatData.redCreature3.Y = 260;
		break;
		
		default: show_debug_message("Map not found..."); break;
	}
}

/// @self obj_local_host
function fill_creatures_init_values ()
{
	for (var _combatCreature = 0; _combatCreature < CombatCreature.None; _combatCreature++)
	{
		var _creatureVar = get_combat_creature_from_identifier(_combatCreature)
		
		var _creatureData = get_creature_data(_creatureVar.identifier);
		
		_creatureVar.hp = _creatureData.hp;
		_creatureVar.moveTime = global.combatCreatureInitialDelay - _creatureData.speed;
		_creatureVar.move1.identifier = _creatureData.moves[0];
		_creatureVar.move2.identifier = _creatureData.moves[1];
		_creatureVar.move3.identifier = _creatureData.moves[2];
		_creatureVar.move4.identifier = _creatureData.moves[3];
		_creatureVar.passiveAbility1 = _creatureData.passiveAbilities[0];
		_creatureVar.passiveAbility2 = _creatureData.passiveAbilities[1];
		_creatureVar.passiveAbility3 = _creatureData.passiveAbilities[2];
		_creatureVar.activeAbility.identifier = _creatureData.activeAbility;
	}
}

/// @self obj_local_host
function spawn_creatures ()
{
	for (var _combatCreature = 0; _combatCreature < CombatCreature.None; _combatCreature++)
	{
		var _creature = get_combat_creature_from_identifier(_combatCreature);
		
		var _modelSprite = get_model_sprite_by_creature(_creature.identifier);
		var _iconSprite = get_icon_sprite_by_creature(_creature.identifier);
		
		var _modelLayer = layer_get_id("CreatureModels");
		var _iconLayer = layer_get_id("CreatureIcons");
		
		var _modelInst = instance_create_layer(0, 0, _modelLayer, obj_creature_model);
		var _iconInst = instance_create_layer(0, 20, _iconLayer, obj_creature_icon);
		
		_modelInst.sprite_index = _modelSprite;
		_iconInst.sprite_index = _iconSprite;
		
		_modelInst.combatCreature = _combatCreature;
		_iconInst.combatCreature = _combatCreature;
		_modelInst.creature = get_combat_creature_from_identifier(_combatCreature);
		_iconInst.creature = get_combat_creature_from_identifier(_combatCreature);
		
		_creature.modelInst = _modelInst;
		_creature.iconInst = _iconInst;
	}
}

/// @self obj_local_host
function create_combat_move (_deployData, _moveIdentifier, _creatorCreature, _creatorMoveID)
{
	var _combatMove = get_combat_move_var();
	var _data = get_move_data(_moveIdentifier);
	
	_combatMove.identifier = _moveIdentifier;
	_combatMove.ID = combatData.nextMoveID;
	combatData.nextMoveID++;
	_combatMove.creatorCreature = _creatorCreature;
	_combatMove.creatorMoveID = _creatorMoveID;
	_combatMove.X = _deployData.X;
	_combatMove.Y = _deployData.Y;
	_combatMove.direction = _deployData.direction;
	
	var _moveSprite = get_move_sprite_by_identifier(_moveIdentifier);
	var _moveLayer = layer_get_id("Moves");
	var _moveInst = instance_create_layer(0, 0, _moveLayer, obj_move);
	
	_moveInst.sprite_index = _moveSprite;
	_moveInst.image_xscale = _data.size;
	_moveInst.image_yscale = _data.size;
	
	_combatMove.inst = _moveInst;
}