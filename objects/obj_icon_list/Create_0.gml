iconList = [];

iconLayer = layer_get_id("CreatureIcons");
instLayer = layer_get_id("Instances");



for (var _i = 0; _i < 4; _i++)
{
	var _xPos = 0;
	switch _i
	{
		case 0: _xPos = 110; break;
		case 1: _xPos = 250; break;
		case 2: _xPos = 390; break;
		case 3: _xPos = 530; break;
		default: show_debug_message("There should be no fifth team slot..."); continue;
	}
	
	var _inst = instance_create_layer(_xPos, 290, instLayer, obj_team_slot);
	_inst.teamSlot = _i;
}

for (var _creatureID = 0; _creatureID < Creature.None; _creatureID++)
{
	var _iconSprite = get_icon_sprite_by_creature(_creatureID);
	
	var _inst = instance_create_layer(bbox_left+30 + 40*(_creatureID mod 7), bbox_top+30 + 40*(_creatureID div 7), iconLayer, obj_icon_slot);
	_inst.creatureID = _creatureID;
	_inst.sprite_index = _iconSprite;
	
	array_push(iconList, _inst);
}