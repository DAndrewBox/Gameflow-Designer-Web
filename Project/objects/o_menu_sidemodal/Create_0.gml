/// @description Setup
depth = -99;

LABELS = ["ID", "TEXT", "COLOR"];

MENU_XOFF = -16;
MENU_YOFF = o_Menu_Top.MENU_YOFF;
MENU_XOFF_TO = MENU_XOFF;
MENU_IS_OPEN = false;

MENU_BUTTONS = ds_list_create();
MENU_BUTTONS[| 0] = new Button({ x: 0,
								 y: 80,
								 icon: s_Arrows_Horizontal,
								 iconIndex: 0,
								 onlyIcon: true,
								 width: 16,
								 height: WINDOW_WIDTH + MENU_YOFF,
								 onClick: toggle_sidemodal_menu,
								});

MENU_ENTRIES = ds_list_create();
MENU_ENTRIES[| 0] = new Entry({
	text: "",
	placeholder: "Enter ID...",
	x: 96,
	y: 16,
	font: fnt_Default,
	fixedWidth: true,
	width: 224,
	height: 16,
});

MENU_ENTRIES[| 1] = new Entry({
	text: "",
	placeholder: "Insert some text here...",
	x: 96,
	y: 48,
	font: fnt_Default,
	fixedWidth: true,
	width: 224,
	height: 96,
	longEntry: true,
	textVAlign: fa_top,
});