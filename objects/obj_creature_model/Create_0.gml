firstStep = true;

creatureNum = 0;
creature = undefined;

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");