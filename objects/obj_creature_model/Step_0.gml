if localHostObj == noone then exit;

if firstStep
{
	firstStep = false;
	
	switch creatureNum
	{
		case 0: creature = localHostObj.combatData.blueCreature1; break;
		case 1: creature = localHostObj.combatData.blueCreature2; break;
		case 2: creature = localHostObj.combatData.blueCreature3; break;
		case 3: creature = localHostObj.combatData.blueCreature4; break;
		case 4: creature = localHostObj.combatData.redCreature1; break;
		case 5: creature = localHostObj.combatData.redCreature2; break;
		case 6: creature = localHostObj.combatData.redCreature3; break;
		case 7: creature = localHostObj.combatData.redCreature4; break;
		default: show_debug_message("Creature not accounted for..."); break;
	}
}

if ( creatureNum < 4 && localHostObj.combatData.blueBenchNum == creatureNum + 1 ) then exit;
if ( creatureNum >= 4 && localHostObj.combatData.redBenchNum == creatureNum mod 4 + 1 ) then exit;

x = creature.xPos;
y = creature.yPos;