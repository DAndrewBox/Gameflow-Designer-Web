/// @description Draw Module
var _x = WINDOW_WIDTH + MENU_XOFF;
var _y = 80 + MENU_YOFF;

draw_set_alpha(1);
draw_set_color(THEME_CURRENT.BOX_DEFAULT);
draw_rectangle(_x, _y, WINDOW_WIDTH, WINDOW_HEIGHT, false);

draw_set_color(THEME_CURRENT.TEXT_DEFAULT);
draw_set_font(fnt_Bold);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

draw_text(_x + 24, _y + 24, "Node Information");

var _text_yoff = 0;
for (var i = 0; i < ds_list_size(MENU_ENTRIES); i++) {
	var _entry = MENU_ENTRIES[| i];
	draw_set_color(THEME_CURRENT.TEXT_DEFAULT);
	draw_set_font(fnt_Semibold);
	draw_text(_x + 24, _y + 50 + (i * 30), LABELS[i]);
	
	_entry.draw();
	_text_yoff += MENU_ENTRIES[| i].height + 50;
}

draw_set_color(THEME_CURRENT.TEXT_DEFAULT);
draw_set_font(fnt_Bold);
draw_text(_x + 24, _y + 24 + _text_yoff, "Custom Information");


MENU_BUTTONS[| 0].draw();
draw_set_color(THEME_CURRENT.BOX_DARKER);
draw_line(_x + 16, _y, _x + 16, WINDOW_HEIGHT);