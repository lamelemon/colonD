var _move_x = 0;
var _move_y = 0;

with (JoystickHousing)
{
	_move_x = joy_x / radius;
	_move_y = joy_y / radius;
}

x += _move_x * var_movement_speed * delta_time / 1000000;
y += _move_y * var_movement_speed * delta_time / 1000000;

move_wrap(true, true, 0);
