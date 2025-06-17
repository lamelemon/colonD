Array_Masks = tag_get_asset_ids("Mask", asset_sprite);
Array_Modifiers = tag_get_asset_ids("mask_modifier", asset_sprite);

bool_is_mask_ui_open = false;

var_offset_distance = 30;
target_radius = 64;

var_current_mask = 0;
var_mask_count = array_length(global.masks);

array_mask_instances = [];


x = room_width / 2;
y = room_height / 2;

function Mask_chosen( _chosen_mask )
{
	var_current_mask = _chosen_mask;
	Mask_ui_closer();
}

function Mask_ui_closer()
{
	for (var i = 0; i < array_length(array_mask_instances); i++) {
		with (array_mask_instances[i]) {
			bool_returning = true;
			var_button_pos_x = var_origin_x;
			var_button_pos_y = var_origin_y;
		}
	}
}

function Mask_ui_opener()
{
	if (array_length(array_mask_instances) > 0) {
		for (var i = 0; i < array_length(array_mask_instances); i++) {
			if (instance_exists(array_mask_instances[i])) {
				return;
			}
		}
	}
	
	array_mask_instances = [];
	bool_is_mask_ui_open = true;
	
	var angle_offset = -90; // Start at top

	for (var i = 0; i < var_mask_count; i++) {
		var angle = angle_offset + (360 / var_mask_count) * i;
		var mask_x = obj_Mask_Manager.x + lengthdir_x(target_radius, angle);
		var mask_y = obj_Mask_Manager.y + lengthdir_y(target_radius, angle);
	
		var inst = instance_create_layer(x, y, "UI_Instances", obj_Mask_Menu_Choice)
		array_push(array_mask_instances, inst);
		
		with (inst)
		{
			var_mask = global.masks[i];
			var_button_pos_x = mask_x;
			var_button_pos_y = mask_y;
			var_index = i;
		}
	}
}

function Mask_equip_animation( _chosen_mask )
{
	// player animation and whatnot
}