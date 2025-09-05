if localRequests.joinTeam.request
{
	handle_server_join_team_request(localRequests.joinTeam.team);
	localRequests.joinTeam.request = false;
}
if localRequests.combatStart.request
{
	handle_server_combat_start_request();
	localRequests.combatStart.request = false;
}