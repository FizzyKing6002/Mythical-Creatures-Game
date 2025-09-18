if room == rm_lobby
{
	instance_create_depth(320, 304, 0, obj_party_select_start);
	exit;
}

if room == rm_combat
{
	handle_combat_start();
	send_combat_sync_accept();
	
	var _deployData = get_deploy_data_by_method(DeployMethod.CentreDirect, [{ X:320, Y:180 }], CombatCreature.Blue1, -1);
	create_combat_move(_deployData, Move.Fireball, CombatCreature.Blue1, -1, 0);
	
	exit;
}