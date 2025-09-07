inbuf = buffer_create(1, buffer_grow, 1);

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

playerList = [get_player_var()];
playerList[0].steamID = steamID;
playerList[0].steamName = steamName;

combatData =
{
	partySelectStage : 0,
	
	blueID : 0,
	blueCreature1 : get_creature_var(),
	blueCreature2 : get_creature_var(),
	blueCreature3 : get_creature_var(),
	blueCreature4 : get_creature_var(),
	blueBenchNum : 0,
	
	redID : 0,
	redCreature1 : get_creature_var(),
	redCreature2 : get_creature_var(),
	redCreature3 : get_creature_var(),
	redCreature4 : get_creature_var(),
	redBenchNum : 0,
}



function local_get_player_ready (_steamID)
{
	return get_player_ready(_steamID);
}
function local_get_all_players_ready ()
{
	return get_all_players_ready();
}
function local_get_team_full (_team)
{
	return get_team_full(_team);
}
function local_get_player_team (_steamID)
{
	return get_player_team(_steamID);
}
function local_get_num_non_spectators ()
{
	return get_num_non_spectators();
}
function local_get_current_party_slot_empty ()
{
	return get_current_party_slot_empty();
}