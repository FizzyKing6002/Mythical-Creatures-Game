if localHostObj == noone then exit;

var _partySelectStage = localHostObj.combatData.partySelectStage;
if _partySelectStage > completedSegments
{
	completedSegments = _partySelectStage;
	startMS = current_time;
}

var _segmentTime = current_time - startMS;
segmentProgress = clamp(_segmentTime / segmentDuration, 0, 1);

if instance_exists(obj_server) && _segmentTime > segmentDuration + lenienceDuration && completedSegments < 8
{
	localHostObj.localRequests.partySelectTimeout.request = true;
	
	completedSegments++;
	segmentProgress = 0;
	startMS = current_time;
}