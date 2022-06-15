/// @description Draw Module
draw_set_alpha(1);
draw_set_color(THEME_CURRENT.BOX_DEFAULT);
draw_rectangle(0, 0, WINDOW_WIDTH, 80 + MENU_YOFF, false);

draw_sprite_ext(s_Logo, 0, 32, 32 + MENU_YOFF, LOGO_SCALE, LOGO_SCALE, 0, -1, 1);


MENU_TITLE_ENTRY.draw();
for (var i = 0; i < ds_list_size(MENU_BUTTONS); i++) {
	MENU_BUTTONS[| i].draw();
}

draw_set_color(THEME_CURRENT.BOX_DARKER);
draw_line(0, 64 + MENU_YOFF, WINDOW_WIDTH, 64 + MENU_YOFF);

draw_set_colour(#FFFFFF);
draw_text(8, 96 + MENU_YOFF, fps_real);
