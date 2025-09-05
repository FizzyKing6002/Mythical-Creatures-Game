/// @self obj_local_host
function handle_combat_start ()
{
	var _nonSpectators = get_ids_of_non_spectators();
	combatData.player1ID = _nonSpectators[0];
	combatData.player2ID = _nonSpectators[1];
	
	init_player(combatData.player1ID);
	init_player(combatData.player2ID);
}

/// @self obj_local_host
function init_player (_playerID)
{
	var _index = get_index_by_player_id(_playerID);
	
	if _index == -1 then { show_debug_message("Target player to initialise not found..."); return; }
	var _player = playerList[_index];
	
	spawn_creature(_player.creature1);
	spawn_creature(_player.creature2);
	spawn_creature(_player.creature3);
	spawn_creature(_player.creature4);
}

/// @self obj_local_host
function spawn_creature (_creature)
{
	var _modelSprite = get_model_sprite_by_creature(_creature.identifier);
	var _iconSprite = get_icon_sprite_by_creature(_creature.identifier);
	
	var _modelLayer = layer_get_id("CreatureModels");
	var _iconLayer = layer_get_id("CreatureIcons");
	
	var _modelInst = instance_create_layer(_creature.xPos, _creature.yPos, _modelLayer, obj_creature_model);
	var _iconInst = instance_create_layer(320, 20, _iconLayer, obj_creature_icon);
	
	_modelInst.sprite_index = _modelSprite;
	_iconInst.sprite_index = _iconSprite;
	
	_creature.modelInst = _modelInst
	_creature.iconInst = _iconInst
}

/// @self obj_local_host
function get_model_sprite_by_creature (_identifier)
{
	switch _identifier
	{
		case Creature.Salamander: return spr_salamander_model;
		default: show_debug_message("No icon for unknown creature..."); return spr_missing_64;
	}
}

/// @self obj_local_host
function get_icon_sprite_by_creature (_identifier)
{
	switch _identifier
	{
		case Creature.Salamander: return spr_salamander_icon;
		default: show_debug_message("No icon for unknown creature..."); return spr_missing_32;
	}
}