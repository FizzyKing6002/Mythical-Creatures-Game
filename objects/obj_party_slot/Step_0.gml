if localHostObj == noone then exit;

var _creatureID = Creature.None;
switch partySlot
{
	case PartySelectStage.Blue1: _creatureID = localHostObj.combatData.blueCreature1.identifier; break;
	case PartySelectStage.Blue2: _creatureID = localHostObj.combatData.blueCreature2.identifier; break;
	case PartySelectStage.Blue3: _creatureID = localHostObj.combatData.blueCreature3.identifier; break;
	case PartySelectStage.Blue4: _creatureID = localHostObj.combatData.blueCreature4.identifier; break;
	case PartySelectStage.Red1: _creatureID = localHostObj.combatData.redCreature1.identifier; break;
	case PartySelectStage.Red2: _creatureID = localHostObj.combatData.redCreature2.identifier; break;
	case PartySelectStage.Red3: _creatureID = localHostObj.combatData.redCreature3.identifier; break;
	case PartySelectStage.Red4: _creatureID = localHostObj.combatData.redCreature4.identifier; break;
	default: show_debug_message("Team slot out of range..."); break;
}

if _creatureID == Creature.None then displaySprite = undefined;
else displaySprite = get_model_sprite_by_creature(_creatureID);

if localHostObj.combatData.partySelectStage == partySlot
{
	image_index = 1;
	exit;
}
if partySlot == PartySelectStage.Blue4 || partySlot == PartySelectStage.Red4
{
	image_index = 2;
	exit;
}
image_index = 0;