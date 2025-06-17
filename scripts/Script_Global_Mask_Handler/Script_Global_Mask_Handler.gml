function Script_Global_Mask_Handler(){

}

function Mask_chosen(_manager, _chosen_mask) {
	if (instance_exists(_manager.current_mask_instance)) {
        with (_manager.current_mask_instance) {
            instance_destroy();
        }
    }
	
	var inst = instance_create_layer(_manager.x, _manager.y, "UI_Instances", obj_Mask_Instance);
	
	_manager.current_mask_instance = inst;
	
	global.mask_data = _chosen_mask;

    Mask_ui_closer(_manager);
}

function Mask_ui_closer(_manager) {
    for (var i = 0; i < array_length(_manager.array_mask_instances); i++) {
        with (_manager.array_mask_instances[i]) {
            bool_returning = true;
            var_button_pos_x = var_origin_x;
            var_button_pos_y = var_origin_y;
        }
    }

    _manager.bool_is_mask_ui_open = false;
}

function Mask_ui_opener(_manager, _button) {
    if (array_length(_manager.array_mask_instances) > 0) {
        for (var i = 0; i < array_length(_manager.array_mask_instances); i++) {
            if (instance_exists(_manager.array_mask_instances[i])) {
                return;
            }
        }
    }

    _manager.array_mask_instances = [];
    _manager.bool_is_mask_ui_open = true;

    var angle_offset = -90;
    var count = _manager.var_mask_count;

    for (var i = 0; i < count; i++) {
        var angle = angle_offset + (360 / count) * i;
        var mask_x = _manager.x + lengthdir_x(_manager.target_radius, angle);
        var mask_y = _manager.y + lengthdir_y(_manager.target_radius, angle);

        var inst = instance_create_layer(_button.x, _button.y, "UI_Instances", obj_Mask_Menu_Choice);
        array_push(_manager.array_mask_instances, inst);

        with (inst) {
            var_mask = global.masks[i];
            var_button_pos_x = mask_x;
            var_button_pos_y = mask_y;
        }
    }
}
