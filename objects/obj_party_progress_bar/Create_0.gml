completedSegments = 0;
segmentProgress = 0;
segmentDuration = 10000;
finalDuration = 5000;
lenienceDuration = 2000;

startMS = current_time;

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");