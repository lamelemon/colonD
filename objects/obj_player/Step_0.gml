var _move_x = 0;
var _move_y = 0;

with (JoystickHousing)
{
	_move_x = joy_x / radius;
	_move_y = joy_y / radius;
}

// Calculate movement vector
if (_move_x != 0 || _move_y != 0) {
    // Player is moving
    var_x_movement = _move_x * var_movement_speed * delta_time / 1000000;
    var_y_movement = _move_y * var_movement_speed * delta_time / 1000000;
    global.player_collisions = move_and_collide(var_x_movement, var_y_movement, var_collision_tilemap);

    // Set run animation
    if (sprite_index != player_character_run) {
        sprite_index = player_character_run;
        image_index = 0;        // Restart animation
        image_speed = 1;        // Adjust if needed
    }
} else {
    // Player is idle
    if (sprite_index != player_character_idle) {
        sprite_index = player_character_idle;
        image_index = 0;
        image_speed = 1;
    }
}

