/// @description Check stuff
t_check_display_size++;
if (t_check_display_size > 5) {
	if (display_get_width() != WINDOW_WIDTH || display_get_height() != WINDOW_HEIGHT) {
		global.WINDOW_W	= display_get_width();
		global.WINDOW_H	= display_get_height();
		window_set_rectangle(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);
		display_set_gui_maximise();
	}

	t_check_display_size = 0;
}

