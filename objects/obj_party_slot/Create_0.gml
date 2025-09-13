textColor = c_white;
text = "Team Select";

partySlot = PartySelectStage.None;
displaySprite = undefined;

image_xscale = 1.5;
image_yscale = 0.75;

localHostObj = noone;
if instance_exists(obj_server) then localHostObj = global.server;
else if instance_exists(obj_client) then localHostObj = global.client;
else show_debug_message("Server or client not initialised...");