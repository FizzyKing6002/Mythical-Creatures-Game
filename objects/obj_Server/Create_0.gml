event_inherited();



playerList[0].ready = true;

localRequests =
{
	joinTeam : { request : false, team : Team.None, },
	partySelectStart : { request : false, },
	partySelectTimeout : { request : false, },
	partySelectNext : { request : false, },
	partySelectCreature : { request : false, creature : Creature.None, },
	combatStart : { request : false, },
}