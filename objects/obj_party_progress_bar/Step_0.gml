if localHostObj == noone || startMS == -1 then exit;

var _partySelectStage = localHostObj.combatData.partySelectStage;
if _partySelectStage > completedSegments
{
	completedSegments = _partySelectStage;
	startMS = current_time;
}

var _segmentTime = current_time - startMS;
if completedSegments == 8 then segmentProgress = clamp(_segmentTime / finalDuration, 0, 1);
else segmentProgress = clamp(_segmentTime / segmentDuration, 0, 1);

if instance_exists(obj_server)
{
	if completedSegments < 8 && _segmentTime > segmentDuration + lenienceDuration
	{
		localHostObj.localRequests.partySelectTimeout.request = true;
		
		completedSegments++;
		segmentProgress = 0;
		startMS = current_time;
		
		exit;
	}
	if completedSegments == 8 && _segmentTime > finalDuration
	{
		localHostObj.localRequests.combatStart.request = true;
		startMS = -1;
		exit;
	}
}