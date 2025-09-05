inbuf = buffer_create(1, buffer_grow, 1);

steamID = steam_get_user_steam_id();
steamName = steam_get_persona_name();

playerList = [get_player_var()];
playerList[0].steamID = steamID;
playerList[0].steamName = steamName;

combatData =
{
	player1ID : 0,
	player2ID : 0,
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
function local_get_player_spectating (_steamID)
{
	return get_player_spectating(_steamID);
}
function local_get_num_non_spectators ()
{
	return get_num_non_spectators();
}