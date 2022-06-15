#region Colours
#macro	col_white		make_colour_rgb(228, 228, 228)
#macro	col_black		make_colour_rgb(27, 27, 27)

#macro	col_box			make_colour_rgb(40, 42, 54)
#macro	col_box_dark	make_colour_rgb(33, 34, 44)
#macro	col_box_light	make_colour_rgb(61, 64, 82)

#macro	col_snow		make_colour_rgb(78, 95, 110)
#macro	col_snow_dark	make_colour_rgb(29, 37, 43)
#macro	col_snow_light	make_colour_rgb(163, 177, 188)

#macro	col_navy		make_colour_rgb(79, 89, 132)
#macro	col_navy_dark	make_colour_rgb(18, 27, 62)
#macro	col_navy_light	make_colour_rgb(112, 144, 203)

#macro	col_sky			make_colour_rgb(99, 172, 229)
#macro	col_sky_dark	make_colour_rgb(75, 134, 180)
#macro	col_sky_light	make_colour_rgb(231, 239, 246)

#macro	col_red			make_colour_rgb(254, 0, 50)
#macro	col_red_dark	make_colour_rgb(84, 0, 16)
#macro	col_red_light	make_colour_rgb(255, 86, 119)

#macro	col_lime		make_colour_rgb(122, 179, 23)
#macro	col_lime_dark	make_colour_rgb(13, 103, 89)
#macro	col_lime_light	make_colour_rgb(160, 197, 95)

#macro	col_sun			make_colour_rgb(254, 156, 23)
#macro	col_sun_dark	make_colour_rgb(247, 98, 66)
#macro	col_sun_light	make_colour_rgb(251, 210, 131)

#macro	col_nite		make_colour_rgb(93, 84, 164)
#macro	col_nite_dark	make_colour_rgb(42, 61, 102)
#macro	col_nite_light	make_colour_rgb(157, 101, 201)

#macro	col_pink		#FF6FA5
#macro	col_pink_dark	#8865FF
#macro	col_pink_light	#FFDAC0

#macro col_orange		#F86E51
#macro col_orange_dark	#D1193E
#macro col_orange_light	#F2C85B

#macro col_light		#E5E8ED
#macro col_light_dark	#666B71
#macro col_light_light	#F1F1F1
#endregion

#region Globals
global.LIST_NODES	= ds_list_create();
global.LIST_TABS	= ds_list_create();

global.TABS_CURRENT	= 0;

global.WINDOW_W		= browser_width;
global.WINDOW_H		= browser_height;

global.CANVAS_VIEW	= { x: 0, y: 0 };

global.LAST_NODE_SIZE	= { w: 208, h:48 };
global.TOTAL_NODE_COUNT	= 0;

	#region Themes
	global.PALETTES = {
		DARK: {
			BOX_DEFAULT		: col_box,
			BOX_DARKER		: col_box_dark,
			BOX_HIGHLIGHT	: col_box_light,
			TEXT_DEFAULT	: col_white,
			TEXT_SECONDARY	: col_black
		},
		LIGHT: {
			BOX_DEFAULT		: col_snow,
			BOX_DARKER		: col_snow_dark,
			BOX_HIGHLIGHT	: col_snow_light,
			TEXT_DEFAULT	: col_black,
			TEXT_SECONDARY	: col_white
		},
	};
	
	global.PALETTES_CURRENT = global.PALETTES.DARK;
	#endregion
#endregion

#region Macros
#macro	DEBUG_MODE		true
#macro	NODES			global.LIST_NODES
#macro	TABS			global.LIST_TABS
#macro	THEMES			global.PALETTES

#macro	THEME_CURRENT	global.PALETTES_CURRENT

#macro	WINDOW_WIDTH	global.WINDOW_W
#macro	WINDOW_HEIGHT	global.WINDOW_H

#macro	MOUSE_GUI_X		window_mouse_get_x()
#macro	MOUSE_GUI_Y		window_mouse_get_y()

#macro	CANVAS_VIEW_X	global.CANVAS_VIEW.x
#macro	CANVAS_VIEW_Y	global.CANVAS_VIEW.y

#macro	TAB_CURRENT		global.TABS_CURRENT

#macro	NODE_ID_PREFIX		"NODE-"
#macro	NODE_DEFAULT_TEXT	"Insert some text here..."
#macro	NODE_LAST_WIDTH		global.LAST_NODE_SIZE.w
#macro	NODE_LAST_HEIGHT	global.LAST_NODE_SIZE.h
#macro	NODE_MIN_WIDTH		160
#macro	NODE_MIN_HEIGHT		24
#macro	NODE_COUNT			global.TOTAL_NODE_COUNT

#macro	SIDE_MODAL_MIN_W	320
#macro	SIDE_MODAL_MAX_W	WINDOW_WIDTH * .2
#endregion

#region Enums
enum STATE {
	DEFAULT,
	CHANGE_TEXT,
	MOVE,
	CREATE,
	DESTROY,
	CONNECT,
	RESIZE,
	TOGGLE,
}
#endregion

gml_release_mode(!DEBUG_MODE);
