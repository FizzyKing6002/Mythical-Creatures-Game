if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)
{
	if mouse_check_button(mb_left)
	{
		image_alpha = 0.75;
		if mouse_check_button_pressed(mb_left) then select_action();
		exit;
	}
	image_alpha = 0.85;
	exit;
}
image_alpha = 1;