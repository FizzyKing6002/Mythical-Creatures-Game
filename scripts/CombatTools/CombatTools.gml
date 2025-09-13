/// @self obj_local_host
function handle_combat_start ()
{
	fill_spawn_coords_by_map(combatData.map);
	fill_creatures_init_values();
	spawn_creatures();
}

/// @self obj_local_host
function get_creature_turn ()
{
	var _creatureTurnData = [CombatCreature.None, 0];
	
	for (var _combatCreature = 0; _combatCreature < CombatCreature.None; _combatCreature++)
	{
		var _creature = get_creature_struct_from_combat_creature(_combatCreature);
		
		if _creature.moveTime > combatData.time then continue;
		
		var _creatureSpeed = get_creature_data(_creature.identifier).speed;
		
		if _creatureTurnData[0] == CombatCreature.None ||
			_creatureSpeed > _creatureTurnData[1] ||
			( _creatureSpeed == _creatureTurnData[1] && choose(true, false) )
		{
			_creatureTurnData[0] = _combatCreature;
			_creatureTurnData[1] = _creatureSpeed;
		}
	}
	
	return _creatureTurnData[0];
}

/// @self obj_local_host
function fill_spawn_coords_by_map (_map)
{
	switch _map
	{
		case Map.Default:
			combatData.blueCreature1.xPos = 150;
			combatData.blueCreature1.yPos = 100;
			combatData.blueCreature2.xPos = 120;
			combatData.blueCreature2.yPos = 180;
			combatData.blueCreature3.xPos = 150;
			combatData.blueCreature3.yPos = 260;
			combatData.redCreature1.xPos = 490;
			combatData.redCreature1.yPos = 100;
			combatData.redCreature2.xPos = 520;
			combatData.redCreature2.yPos = 180;
			combatData.redCreature3.xPos = 490;
			combatData.redCreature3.yPos = 260;
		break;
		
		default: show_debug_message("Map not found..."); break;
	}
}

/// @self obj_local_host
function fill_creatures_init_values ()
{
	for (var _combatCreature = 0; _combatCreature < CombatCreature.None; _combatCreature++)
	{
		var _creatureVar = get_creature_struct_from_combat_creature(_combatCreature)
		
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
		_creatureVar.activeAbility = _creatureData.activeAbility;
	}
}

/// @self obj_local_host
function spawn_creatures ()
{
	for (var _combatCreature = 0; _combatCreature < CombatCreature.None; _combatCreature++)
	{
		var _creature = get_creature_struct_from_combat_creature(_combatCreature);
		
		var _modelSprite = get_model_sprite_by_creature(_creature.identifier);
		var _iconSprite = get_icon_sprite_by_creature(_creature.identifier);
		
		var _modelLayer = layer_get_id("CreatureModels");
		var _iconLayer = layer_get_id("CreatureIcons");
		
		var _modelInst = instance_create_layer(0, 0, _modelLayer, obj_creature_model);
		var _iconInst = instance_create_layer(0, 20, _iconLayer, obj_creature_icon);
		
		_modelInst.sprite_index = _modelSprite;
		_iconInst.sprite_index = _iconSprite;
		
		_modelInst.creatureNum = _combatCreature;
		_iconInst.creatureNum = _combatCreature;
		
		_creature.modelInst = _modelInst;
		_creature.iconInst = _iconInst;
	}
}

/// @self obj_local_host
function get_creature_struct_from_combat_creature (_combatCreature)
{
	switch _combatCreature
	{
		case CombatCreature.Blue1: return combatData.blueCreature1;
		case CombatCreature.Blue2: return combatData.blueCreature2;
		case CombatCreature.Blue3: return combatData.blueCreature3;
		case CombatCreature.Blue4: return combatData.blueCreature4;
		case CombatCreature.Red1: return combatData.redCreature1;
		case CombatCreature.Red2: return combatData.redCreature2;
		case CombatCreature.Red3: return combatData.redCreature3;
		case CombatCreature.Red4: return combatData.redCreature4;
		default: show_debug_message("Creature not accounted for..."); return;
	}
}