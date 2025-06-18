if (!layer_get_visible("ESC_Menu") && global.mask_data != undefined && is_callable(global.mask_data.ability)) {
    global.mask_data.ability();
}