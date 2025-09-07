if localRequests.joinTeam.request
{
	handle_server_join_team_request(localRequests.joinTeam.team);
	localRequests.joinTeam.request = false;
}

if localRequests.partySelectStart.request
{
	handle_server_party_select_start_request();
	localRequests.partySelectStart.request = false;
}

if localRequests.partySelectTimeout.request
{
	handle_server_party_select_timeout_request();
	localRequests.partySelectTimeout.request = false;
}

if localRequests.partySelectNext.request
{
	handle_server_party_select_next_request();
	localRequests.partySelectNext.request = false;
}

if localRequests.partySelectCreature.request
{
	handle_server_party_select_creature_request(localRequests.partySelectCreature.creature);
	localRequests.partySelectCreature.request = false;
}

if localRequests.combatStart.request
{
	handle_server_combat_start_request();
	localRequests.combatStart.request = false;
}