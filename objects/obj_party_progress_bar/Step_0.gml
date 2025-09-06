var _segmentTime = current_time - startMS;

segmentProgress = clamp(_segmentTime / segmentDuration, 0, 1);

if instance_exists(obj_server) && _segmentTime > segmentDuration + lenienceDuration
{
	global.server.localRequests.partySelectNext.request = true;
	global.server.localRequests.partySelectNext.force = true;
	
	completedSegments++;
	startMS = current_time;
}