/// @self obj_local_host
function player_currently_selecting (_playerID)
{
	var _team = get_player_team(_playerID);
	switch _team
	{
		case Team.None: return false;
		case Team.Blue: if !array_contains([0, 3, 4, 6], combatData.partySelectStage) then return false;
		case Team.Red: if !array_contains([1, 2, 5, 7], combatData.partySelectStage) then return false;
		default: show_debug_message("Team not accounted for..."); return false;
	}
	return true;
}

/// @self obj_local_host
function get_current_party_slot_empty ()
{
	switch combatData.partySelectStage
	{
		case 0: return combatData.blueCreature1.identifier == Creature.None;
		case 1: return combatData.redCreature1.identifier == Creature.None;
		case 2: return combatData.redCreature2.identifier == Creature.None;
		case 3: return combatData.blueCreature2.identifier == Creature.None;
		case 4: return combatData.blueCreature3.identifier == Creature.None;
		case 5: return combatData.redCreature3.identifier == Creature.None;
		case 6: return combatData.blueCreature4.identifier == Creature.None;
		case 7: return combatData.redCreature4.identifier == Creature.None;
		default: show_debug_message("Ninth party select stage not accounted for..."); return false;
	}
}

/// @self obj_local_host
function next_party_select_stage ()
{
	combatData.partySelectStage++;
}

/// @self obj_local_host
function get_creature_chosen (_creature)
{
	if _creature == combatData.blueCreature1.identifier then return true;
	if _creature == combatData.blueCreature2.identifier then return true;
	if _creature == combatData.blueCreature3.identifier then return true;
	if _creature == combatData.blueCreature4.identifier then return true;
	if _creature == combatData.redCreature1.identifier then return true;
	if _creature == combatData.redCreature2.identifier then return true;
	if _creature == combatData.redCreature3.identifier then return true;
	if _creature == combatData.redCreature4.identifier then return true;
	return false;
}

/// @self obj_local_host
function change_current_creature (_creature)
{
	switch combatData.partySelectStage
	{
		case 0: combatData.blueCreature1.identifier = _creature; break;
		case 1: combatData.redCreature1.identifier = _creature; break;
		case 2: combatData.redCreature2.identifier = _creature; break;
		case 3: combatData.blueCreature2.identifier = _creature; break;
		case 4: combatData.blueCreature3.identifier = _creature; break;
		case 5: combatData.redCreature3.identifier = _creature; break;
		case 6: combatData.blueCreature4.identifier = _creature; break;
		case 7: combatData.redCreature4.identifier = _creature; break;
		default: show_debug_message("Ninth party select stage not accounted for..."); break;
	}
}