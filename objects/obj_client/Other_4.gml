if room == rm_lobby
{
	instance_create_depth(320, 304, 0, obj_lobby_ready);
	exit;
}

if room == rm_combat
{
	handle_combat_start();
	exit;
}