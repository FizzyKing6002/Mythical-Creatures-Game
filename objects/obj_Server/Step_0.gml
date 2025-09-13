if room != rm_combat then exit;

var _creatureTurn = get_creature_turn();

if _creatureTurn == CombatCreature.None
{
	combatData.time++;
	exit;
}