var scale_x = obj_player.image_xscale;
var offset_x = var_offset_x * scale_x;
var offset_y = var_offset_y;

// Tiny idle bobbing fix
var bob_offset = 0;

var frame = floor(obj_player.image_index);
if (frame == 1) bob_offset = -1;
else if (frame == 2) bob_offset = 0;

// Draw the mask with subtle bob
draw_sprite_ext(
    global.mask_data.sprite,
    0,
    obj_player.x + offset_x,
    obj_player.y + offset_y + bob_offset,
    scale_x,
    1,
    0,
    c_white,
    1
);
