if localHostObj == noone then exit;

if firstStep
{
	firstStep = false;
	move = get_combat_move_from_id(moveID);
}

x = move.X;
y = move.Y;