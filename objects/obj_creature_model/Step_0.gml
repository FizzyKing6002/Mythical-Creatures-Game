if localHostObj == noone then exit;

if ( combatCreature == localHostObj.combatData.blueBenchCreature ||
	combatCreature == localHostObj.combatData.redBenchCreature ) then
	exit;

x = creature.X;
y = creature.Y;