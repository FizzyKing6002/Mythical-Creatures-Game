if !firstStep exit;
firstStep = false;

if ready then { readyText = "Ready"; image_index = 3; }

switch team
{
	case Team.Blue: teamText = "Blue Team"; break;
	case Team.Red: teamText = "Red Team"; break;
}