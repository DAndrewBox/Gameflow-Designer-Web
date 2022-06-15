/// @description Check buttons
MENU_YOFF = o_Menu_Top.MENU_YOFF;

var _mb_left_pressed = mouse_check_button_pressed(mb_left);
// Buttons
var _button;
for (var i = 0; i < ds_list_size(MENU_BUTTONS); i++) {
	_button = MENU_BUTTONS[| i];
	_button.x = WINDOW_WIDTH + MENU_XOFF;
	_button.y = _button.ystart + MENU_YOFF;
	
	if (i == 0) {
		_button.height = WINDOW_HEIGHT - _button.y;
	}
	
	if (_button.isHover() && _mb_left_pressed) {
		_button.onClick();
		break;
	}
}

// Entries
for (var i = 0; i < ds_list_size(MENU_ENTRIES); i++) {
	var _entry	= MENU_ENTRIES[| i];
	_entry.x	= _button.xstart + WINDOW_WIDTH + MENU_XOFF + 80;
	_entry.y	= _button.ystart + MENU_YOFF + 40 + (i * 32);
	
	if (_mb_left_pressed) {
		if (_entry.isHover()) {
			_entry.active = true;
			keyboard_string = _entry.text;
		} else {
			_entry.active = false;
		}
	}
	
	if (_entry.active) {
		_entry.setText(keyboard_string, keyboard_lastkey);
	}
}

MENU_XOFF = lerp(MENU_XOFF, MENU_XOFF_TO, .2);