inbuf = buffer_create(1, buffer_grow, 1);

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

playerList = [get_lobby_player_var()];
playerList[0].steamID = steamID;
playerList[0].steamName = steamName;

combatData =
{
	partySelectStage : 0,
	map : Map.Default,
	combatTime : 0,
	actualTime : 0,
	timeDiff : 0,
	creatureTurn : CombatCreature.None,
	
	blueID : 0,
	redID : 0,
	
	blueBenchCreature : CombatCreature.Blue4,
	redBenchCreature : CombatCreature.Red4,
	
	blueCreature1 : get_combat_creature_var(),
	blueCreature2 : get_combat_creature_var(),
	blueCreature3 : get_combat_creature_var(),
	blueCreature4 : get_combat_creature_var(),
	redCreature1 : get_combat_creature_var(),
	redCreature2 : get_combat_creature_var(),
	redCreature3 : get_combat_creature_var(),
	redCreature4 : get_combat_creature_var(),
	
	nextMoveID : 0,
	moves : [],
	events : [],
	listeners : [],
}



function local_get_player_ready (_steamID) { return get_player_ready(_steamID); }
function local_get_all_players_ready () { return get_all_players_ready(); }
function local_get_team_full (_team) { return get_team_full(_team); }
function local_get_player_team (_steamID) { return get_player_team(_steamID); }
function local_get_num_non_spectators () { return get_num_non_spectators(); }
function local_get_current_party_slot_empty () { return get_current_party_slot_empty(); }
function local_get_team_selecting () { return get_team_selecting(); }