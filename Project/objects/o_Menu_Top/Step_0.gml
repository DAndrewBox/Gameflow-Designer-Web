/// @description Check buttons
var _mb_left_pressed = mouse_check_button_pressed(mb_left);
var _button;
for (var i = 0; i < ds_list_size(MENU_BUTTONS); i++) {
	_button = MENU_BUTTONS[| i];
	_button.y = _button.ystart + MENU_YOFF;
	
	if (_button.isHover() && _mb_left_pressed) {
		_button.onClick();
		break;
	}
}

// Title Entry
MENU_TITLE_ENTRY.y = MENU_TITLE_ENTRY.ystart + MENU_YOFF;
if (_mb_left_pressed) {
	MENU_TITLE_ENTRY.active = MENU_TITLE_ENTRY.isHover();
	keyboard_string = MENU_TITLE_ENTRY.text;
}

if (MENU_TITLE_ENTRY.active) {
	MENU_TITLE_ENTRY.setText(keyboard_string, keyboard_lastkey);
}

#region Logo
LOGO_SCALE = (	mouse_in_rectangle(16, 16, 48, 48)
				? lerp(LOGO_SCALE, 1.25, .1)
				: lerp(LOGO_SCALE, 1, .2)
			 );
#endregion

MENU_YOFF = lerp(MENU_YOFF, MENU_YOFF_TO, .2);
MENU_BUTTONS[| 6].width = WINDOW_WIDTH;