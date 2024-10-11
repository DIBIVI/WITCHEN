var gui_width = display_get_gui_width()
var gui_height = display_get_gui_height()

// shadow of big box
draw_set(c_black, 0.2)
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	(gui_width - ui_padding_x) + ui_border_size,
	(gui_height - ui_padding_y) + ui_border_size,
	false
)

// draw rectangle 

draw_set(colour_border, 1)
draw_rectangle(
	ui_padding_x,
	ui_padding_y,
	(gui_width - ui_padding_x),
	(gui_height - ui_padding_y),
	false
)

// draw inner rectangle
draw_set(colour_background, 1)
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	(gui_width - ui_padding_x) - ui_border_size,
	(gui_height - ui_padding_y) - ui_border_size,
	false
)

// draw border between left and right panel
draw_set(colour_border, 1)
draw_rectangle(
	ui_padding_x + ui_panel_left,
	ui_padding_y + ui_border_size,
	ui_padding_x + ui_panel_left + ui_border_size,
	gui_height - ui_padding_y - ui_border_size,
	false
)

// set up font
draw_set_font(fn_Yu_Gothic)
text_align(fa_left, fa_top)

// INFO text shadow + text
draw_set(c_black, 0.5)
draw_text(
	ui_padding_x + (ui_border_size * 3) + 4,
	ui_padding_y + (ui_border_size * 3) + 4,
	"Information"
)

draw_set(c_red, 1)
draw_text(
	ui_padding_x + (ui_border_size * 3),
	ui_padding_y + (ui_border_size * 3),
	"Information"
)

// INVENTORY text shadow + text
draw_set(c_black, 0.5)
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
	ui_padding_y + (ui_border_size * 3) + 4,
	"Inventory"
)

draw_set(c_red, 1)
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
	ui_padding_y + (ui_border_size * 3),
	"Inventory"
)

// inventory slots

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)


var inventory_items = inventory.item_get()

for (var row = 0; row < inventory_rows; row++)
{
	var pos_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box))
	for (var column = 0; column < inventory_columns; column++;)
		{
		var pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box))
		// draw shadow of inventory boxes
		draw_sprite_ext(spr_inventorybox,0,pos_x + 4,pos_y + 4,1, 1, 0, c_black, 0.4)

		// draw inventory boxes
		draw_sprite(spr_inventorybox, 0,pos_x,pos_y)

		var inventory_index = (row * inventory_columns) + column
		if (inventory_index <= array_length(inventory_items) - 1)
		{
			// draw inventory item
			draw_sprite(inventory_items[inventory_index].sprite, 0, pos_x, pos_y)
		}
		// hovering
		if (is_between(mx, pos_x, pos_x + ui_inventory_box))
		{
			if (is_between(my, pos_y, pos_y + ui_inventory_box))
			{
				draw_set(c_white, 0.2)
				draw_rectangle(pos_x, pos_y, pos_x + ui_inventory_box, pos_y + ui_inventory_box, false)
				draw_reset()
			}
		}
		// quantity
				if (inventory_index <= array_length(inventory_items) - 1)
				{
					draw_set(#232323, 1)
					draw_circle(pos_x + ui_inventory_box, pos_y + ui_inventory_box, 14, false)
		
		
					draw_set(c_white, 1)
					text_align(fa_center, fa_middle)
					draw_set_font(-1)
		
					draw_text(pos_x + ui_inventory_box, 
								pos_y + ui_inventory_box, 
								inventory_items[inventory_index].quantity
						)
				} 
		}
}





















