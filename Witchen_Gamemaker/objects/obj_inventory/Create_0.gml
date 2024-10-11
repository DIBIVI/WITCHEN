randomize();

inventory = new Inventory();


inventory.item_add("fruit", 3, spr_fruit)
inventory.item_add("fruit", 6, spr_fruit)
inventory.item_add("cat", 2, spr_cat)

show_debug_message(inventory)

#region UI Information

display_set_gui_size(1920, 1080)
colour_background = c_aqua
colour_border = c_blue

inventory_columns = 9
inventory_rows = 5

ui_padding_x = 384
ui_padding_y = 244
ui_panel_left = 320
ui_border_size = 8
ui_inventory_padding = 48
ui_inventory_box = 64
ui_inventory_margin = 16

#endregion