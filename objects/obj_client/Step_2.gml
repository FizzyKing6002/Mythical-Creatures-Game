if hostID == 0 then exit;

if localRequests.ready.request
{
	handle_client_ready_request(localRequests.ready.state);
	localRequests.ready.request = false;
}
if localRequests.joinTeam.request
{
	handle_client_join_team_request(localRequests.joinTeam.team);
	localRequests.joinTeam.request = false;
}