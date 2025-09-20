disabled = false;

textColor = c_white;
text = "Debug Combat";



function select_action ()
{
	global.server = instance_create_depth(0, 0, 0, obj_server);
	
	global.server.debugMode = true;
	
	global.server.combatData.blueID = global.server.steamID;
	global.server.combatData.redID = global.server.steamID;
	
	with global.server
	{
		repeat 8
		{
			var _creature = pick_random_available_creature();
			change_current_creature(_creature);
			next_party_select_stage();
		}
	}
	
	room_goto(rm_combat);
}