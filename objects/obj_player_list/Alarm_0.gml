if localHost == undefined then exit;

reset_ready_list();

for (var _i = 0; _i < array_length(localHost.playerList); _i++)
{
	var _inst = instance_create_depth(x, bbox_top + 30 + 40*_i, -20, obj_player_item);
	_inst.ready = localHost.playerList[_i].ready;
	_inst.team = localHost.playerList[_i].team;
	if localHost.playerList[_i].steamID == localHost.steamID then _inst.playerName = "You";
	else _inst.playerName = localHost.playerList[_i].steamName;
	
	array_push(readyList, _inst);
}

alarm[0] = 100;