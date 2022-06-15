/// @description Setup module
depth = -100;

MENU_YOFF = 0;
MENU_YOFF_TO = 0;
MENU_IS_OPEN = true;

draw_set_font(fnt_Title);
MENU_TITLE = "TEST TITLE";
MENU_TITLE_ENTRY = new Entry({
	text: MENU_TITLE,
	x: 64,
	y: 7,
	font: fnt_Title,
	width: string_width(MENU_TITLE) + 2,
	height: string_height(MENU_TITLE) - 10,
	borderVisible: false,
	textYOffset: 3,
});

draw_set_font(fnt_Bold);
MENU_BUTTONS = ds_list_create();
MENU_BUTTONS_TITLES = ["New File", "Save", "Export", "Load", "Settings", "Help"];
MENU_BUTTONS_ICONS	= [s_UI_Files, s_UI_Save, s_UI_Export, s_UI_Load, s_UI_Config, s_UI_FAQ];
MENU_BUTTONS_ACTIONS = [-1, -1, -1, -1, -1, -1];

var _xoff = 0;
var _pad = 12;
for (var i = 0; i < array_length(MENU_BUTTONS_TITLES); i++) {
	MENU_BUTTONS[| i] = new Button({ x: 64 + _xoff,
									 y: 39 + MENU_YOFF,
									 text: MENU_BUTTONS_TITLES[i],
									 width: string_width(MENU_BUTTONS_TITLES[i]),
									 height: string_height(MENU_BUTTONS_TITLES[i]),
									 margin: 4,
									 onClick: MENU_BUTTONS_ACTIONS[i],
									 icon: MENU_BUTTONS_ICONS[i],
								});
								
	_xoff += MENU_BUTTONS[| i].width + MENU_BUTTONS[| i].margin * 2 + _pad;
}

MENU_BUTTONS[| 6] = new Button({ x: 0,
								 y: 64,
								 icon: s_Arrows_Vertical,
								 iconIndex: 0,
								 onlyIcon: true,
								 width: WINDOW_WIDTH,
								 height: 16,
								 onClick: toggle_top_menu,
								});

LOGO_SCALE = 1;
