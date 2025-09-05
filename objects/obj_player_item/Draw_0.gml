draw_self();

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text_transformed(bbox_left+10, y-5, playerName + ":", 0.5, 0.5, 0);
draw_text_transformed(bbox_left+10, y+5, readyText, 0.5, 0.5, 0);

draw_set_halign(fa_right);

draw_text_transformed(bbox_right-10, y+5, teamText, 0.5, 0.5, 0);