if localHostObj == noone then exit;

if ( combatCreature == localHostObj.combatData.blueBenchCreature ||
	combatCreature == localHostObj.combatData.redBenchCreature ) then
	exit;

x = 20 + creature.moveTime - localHostObj.combatData.combatTime;