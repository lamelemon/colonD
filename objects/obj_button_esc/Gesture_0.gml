// Inherit the parent event
event_inherited();

layer_set_visible("ESC_Menu", !layer_get_visible("ESC_Menu"));
if (global.Mask_Manager.bool_is_mask_ui_open)
{
	Mask_ui_closer(global.Mask_Manager);
}