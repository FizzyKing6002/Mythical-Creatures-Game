if localHostObj == noone then exit;

var _creatureID = Creature.None;
switch partySlot
{
	case CombatCreature.Blue1: _creatureID = localHostObj.combatData.blueCreature1.identifier; break;
	case CombatCreature.Blue2: _creatureID = localHostObj.combatData.blueCreature2.identifier; break;
	case CombatCreature.Blue3: _creatureID = localHostObj.combatData.blueCreature3.identifier; break;
	case CombatCreature.Blue4: _creatureID = localHostObj.combatData.blueCreature4.identifier; break;
	case CombatCreature.Red1: _creatureID = localHostObj.combatData.redCreature1.identifier; break;
	case CombatCreature.Red2: _creatureID = localHostObj.combatData.redCreature2.identifier; break;
	case CombatCreature.Red3: _creatureID = localHostObj.combatData.redCreature3.identifier; break;
	case CombatCreature.Red4: _creatureID = localHostObj.combatData.redCreature4.identifier; break;
	default: show_debug_message("Team slot out of range..."); break;
}

if _creatureID == Creature.None then displaySprite = undefined;
else displaySprite = get_model_sprite_by_creature(_creatureID);

if localHostObj.combatData.partySelectStage == partySlot
{
	image_index = 1;
	exit;
}
if partySlot == CombatCreature.Blue4 || partySlot == CombatCreature.Red4
{
	image_index = 2;
	exit;
}
image_index = 0;