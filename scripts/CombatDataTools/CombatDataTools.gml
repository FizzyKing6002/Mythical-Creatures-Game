/// @self obj_local_host
function fill_ids_of_team_players ()
{
	var _ids = get_ids_of_non_spectators();
	if _ids == undefined then { show_debug_message("Failed to fill ids of team players..."); return; }
	
	for (var _i = 0; _i < 2; _i++)
	{
		var _steamID = _ids[_i];
		var _team = get_player_team(_steamID);
		
		if _team == Team.Blue then { combatData.blueID = _steamID; continue; }
		if _team == Team.Red then { combatData.redID = _steamID; continue; }
		show_debug_message("Failed to fill id...");
	}
	
	
}

/// @self obj_local_host
function get_team_selecting ()
{
	var _partySelectStage = combatData.partySelectStage;
	
	if _partySelectStage == PartySelectStage.Blue1 ||
		_partySelectStage == PartySelectStage.Blue2 ||
		_partySelectStage == PartySelectStage.Blue3 ||
		_partySelectStage == PartySelectStage.Blue4
	{
		return Team.Blue;
	}
	if _partySelectStage == PartySelectStage.Red1 ||
		_partySelectStage == PartySelectStage.Red2 ||
		_partySelectStage == PartySelectStage.Red3 ||
		_partySelectStage == PartySelectStage.Red4
	{
		return Team.Red;
	}
	return Team.None;
}

/// @self obj_local_host
function player_currently_selecting (_playerID)
{
	var _team = get_player_team(_playerID);
	switch _team
	{
		case Team.None: return false;
		case Team.Blue: if get_team_selecting() != Team.Blue then return false; break;
		case Team.Red: if get_team_selecting() != Team.Red then return false; break;
		default: show_debug_message("Team not accounted for..."); return false;
	}
	return true;
}

/// @self obj_local_host
function pick_random_available_creature ()
{
	var _chosenCreatures = [];
	array_push(_chosenCreatures, combatData.blueCreature1.identifier);
	array_push(_chosenCreatures, combatData.blueCreature2.identifier);
	array_push(_chosenCreatures, combatData.blueCreature3.identifier);
	array_push(_chosenCreatures, combatData.blueCreature4.identifier);
	array_push(_chosenCreatures, combatData.redCreature1.identifier);
	array_push(_chosenCreatures, combatData.redCreature2.identifier);
	array_push(_chosenCreatures, combatData.redCreature3.identifier);
	array_push(_chosenCreatures, combatData.redCreature4.identifier);
	
	var _randomCreatureChoices = [];
	for (var _i = 0; _i < Creature.None; _i++)
	{
		if array_contains(_chosenCreatures, _i) then continue;
		array_push(_randomCreatureChoices, _i);
	}
	
	var _index = irandom(array_length(_randomCreatureChoices) - 1);
	return _randomCreatureChoices[_index];
}

/// @self obj_local_host
function get_current_party_slot_empty ()
{
	switch combatData.partySelectStage
	{
		case PartySelectStage.Blue1: return combatData.blueCreature1.identifier == Creature.None;
		case PartySelectStage.Red1: return combatData.redCreature1.identifier == Creature.None;
		case PartySelectStage.Red2: return combatData.redCreature2.identifier == Creature.None;
		case PartySelectStage.Blue2: return combatData.blueCreature2.identifier == Creature.None;
		case PartySelectStage.Blue3: return combatData.blueCreature3.identifier == Creature.None;
		case PartySelectStage.Red3: return combatData.redCreature3.identifier == Creature.None;
		case PartySelectStage.Blue4: return combatData.blueCreature4.identifier == Creature.None;
		case PartySelectStage.Red4: return combatData.redCreature4.identifier == Creature.None;
		case PartySelectStage.Preparation: return false;
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

/// @self obj_local_host
function get_combat_creature_from_identifier (_combatCreature)
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

/// @self obj_local_host
function get_combat_move_index_from_id (_moveID)
{
	var _moves = combatData.moves;
	var _index = binary_search_by_field_greater(_moves, "ID", _moveID);
	
	if _index == array_length(_moves) then return undefined;
	if _moves[_index].ID != _moveID then return undefined;
	
	return _index;
}

/// @self obj_local_host
function get_combat_move_from_id (_moveID)
{
	var _moves = combatData.moves;
	var _index = get_combat_move_index_from_id(_moveID);
	
	if _index == undefined then return undefined;
	
	return _moves[_index];
}

/// @self obj_local_host
function is_creature_turn ()
{
	return combatData.creatureTurn != CombatCreature.None;
}