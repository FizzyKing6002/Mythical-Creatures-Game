if localHostObj == noone then exit;

var _creatureID = Creature.None;
switch partySlot
{
	case 0: _creatureID = localHostObj.combatData.blueCreature1.identifier; break;
	case 1: _creatureID = localHostObj.combatData.redCreature1.identifier; break;
	case 2: _creatureID = localHostObj.combatData.redCreature2.identifier; break;
	case 3: _creatureID = localHostObj.combatData.blueCreature2.identifier; break;
	case 4: _creatureID = localHostObj.combatData.blueCreature3.identifier; break;
	case 5: _creatureID = localHostObj.combatData.redCreature3.identifier; break;
	case 6: _creatureID = localHostObj.combatData.blueCreature4.identifier; break;
	case 7: _creatureID = localHostObj.combatData.redCreature4.identifier; break;
	default: show_debug_message("Team slot out of range..."); break;
}

if _creatureID == Creature.None then displaySprite = undefined;
else displaySprite = get_model_sprite_by_creature(_creatureID);

if localHostObj.combatData.partySelectStage == partySlot
{
	image_index = 1;
	exit;
}
image_index = 0;