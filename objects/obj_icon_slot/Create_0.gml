creatureID = Creature.None;

function select_action ()
{
	if !instance_exists(obj_data) then { show_debug_message("Data object not initialised."); return; }
	
	var _creature = undefined;
	switch global.data.teamSelectedSlot
	{
		case 0: _creature = global.data.team.creature1; break;
		case 1: _creature = global.data.team.creature2; break;
		case 2: _creature = global.data.team.creature3; break;
		case 3: _creature = global.data.team.creature4; break;
		default: show_debug_message("Selected slot out of range..."); return;
	}
	
	_creature.identifier = creatureID;
}