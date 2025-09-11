iconList = [];

iconLayer = layer_get_id("CreatureIcons");
instLayer = layer_get_id("Instances");



for (var _i = 0; _i < 8; _i++)
{
	var _xPos = 0;
	var _yPos = 0;
	switch _i
	{
		case 0: _xPos = 90; _yPos = 250; break;
		case 1: _xPos = 430; _yPos = 250; break;
		case 2: _xPos = 550; _yPos = 250; break;
		case 3: _xPos = 210; _yPos = 250; break;
		case 4: _xPos = 80; _yPos = 310; break;
		case 5: _xPos = 440; _yPos = 310; break;
		case 6: _xPos = 200; _yPos = 310; break;
		case 7: _xPos = 560; _yPos = 310; break;
		default: show_debug_message("There should be no ninth party slot..."); continue;
	}
	
	var _inst = instance_create_layer(_xPos, _yPos, instLayer, obj_party_slot);
	_inst.partySlot = _i;
}

for (var _creatureID = 0; _creatureID < Creature.None; _creatureID++)
{
	var _iconSprite = get_icon_sprite_by_creature(_creatureID);
	
	var _inst = instance_create_layer(bbox_left+30 + 40*(_creatureID mod 14), bbox_top+30 + 40*(_creatureID div 14), iconLayer, obj_icon_slot);
	_inst.creatureID = _creatureID;
	_inst.sprite_index = _iconSprite;
	
	array_push(iconList, _inst);
}