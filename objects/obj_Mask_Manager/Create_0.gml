Array_Masks = tag_get_asset_ids("Mask", asset_sprite);
Array_Modifiers = tag_get_asset_ids("mask_modifier", asset_sprite);

bool_is_mask_ui_open = false;

var_offset_distance = 30;
target_radius = 64;

var_mask_count = array_length(global.masks);

array_mask_instances = [];

current_mask_instance = noone;

x = room_width / 2;
y = room_height / 2;

global.Mask_Manager = self;