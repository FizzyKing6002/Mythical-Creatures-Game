if room == rm_lobby
{
	instance_create_depth(320, 304, 0, obj_combat_start);
	exit;
}

if room == rm_combat
{
	handle_combat_start();
	alarm[0] = 500;
	exit;
}