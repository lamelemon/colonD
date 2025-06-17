var _move_x = 0;
var _move_y = 0;

with (JoystickHousing)
{
	_move_x = joy_x / radius;
	_move_y = joy_y / radius;
}

var_x_movement = _move_x * var_movement_speed * delta_time / 1000000;
var_y_movement = _move_y * var_movement_speed * delta_time / 1000000;

global.player_collisions = move_and_collide(var_x_movement, var_y_movement, var_collision_tilemap);
