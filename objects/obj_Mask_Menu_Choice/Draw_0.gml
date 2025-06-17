x = lerp(x, var_button_pos_x, 0.1);
y = lerp(y, var_button_pos_y, 0.1);

if (bool_returning && point_distance(x, y, var_origin_x, var_origin_y) < 1)
{
	x = var_button_pos_x;
	y = var_button_pos_y;
	
	instance_destroy();
}

draw_self();
draw_sprite(var_mask.sprite, 0, x + 1, y + 1);
