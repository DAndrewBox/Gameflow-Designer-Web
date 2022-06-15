/// @description Draw backgrounds
draw_set_alpha(1);
draw_set_colour(#1A1A28);
draw_rectangle(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, false);

draw_set_alpha(.33);
draw_sprite_stretched(bg_Test, 0, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT);

draw_set_alpha(1);
