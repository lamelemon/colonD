

if (point_distance(x, y, var_button_pos_x, var_button_pos_y) < 1) {
	x = var_button_pos_x;
	y = var_button_pos_y;
	
	if (bool_returning)
	{
		instance_destroy();
	}
}

else {
	x = lerp(x, var_button_pos_x, 0.1);
	y = lerp(y, var_button_pos_y, 0.1);
}

draw_self();
draw_sprite(var_mask.sprite, 0, x + 1, y + 1);
