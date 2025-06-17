if (global.Mask_Manager.bool_is_mask_ui_open)
{
    Mask_ui_closer(global.Mask_Manager);
}
else
{
    Mask_ui_opener(global.Mask_Manager, self);
}
