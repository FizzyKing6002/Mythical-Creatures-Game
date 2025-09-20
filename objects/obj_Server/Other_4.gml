if room == rm_lobby
{
	instance_create_depth(320, 304, 0, obj_party_select_start);
	exit;
}

if room == rm_combat
{
	handle_combat_start();
	if !debugMode then send_combat_sync_accept();
	
	event_add_create_move(Move.Fireball, DeployMethod.CentreDirect, [{ X:0, Y:0 }], CombatCreature.Blue1, -1, 0);
	
	exit;
}