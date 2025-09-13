if room == rm_lobby
{
	instance_create_depth(320, 304, 0, obj_party_select_start);
	exit;
}

if room == rm_combat
{
	handle_combat_start();
	send_combat_sync_accept();
	exit;
}