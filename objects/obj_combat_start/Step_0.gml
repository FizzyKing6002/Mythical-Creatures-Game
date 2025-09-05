if !instance_exists(obj_server) then { show_debug_message("Server not initialised..."); exit; }

if !self_get_all_players_ready() or self_get_num_non_spectators() != 2
{
	image_index = 3;
	exit;
}
if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
{
	if mouse_check_button(mb_left)
	{
		image_index = 2;
		if mouse_check_button_pressed(mb_left) then select_action();
		exit;
	}
	image_index = 1;
	exit;
}
image_index = 0;