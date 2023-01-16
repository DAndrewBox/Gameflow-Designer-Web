/// @description Draw self
alpha = lerp(alpha, o_Menu_SideModal.MENU_IS_OPEN * .45, .1);
draw_set_alpha(alpha);
draw_rectangle(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, false);
draw_set_alpha(1);