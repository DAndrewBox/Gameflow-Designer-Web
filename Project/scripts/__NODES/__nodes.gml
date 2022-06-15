/// @func	Node(_params)
/// @param {struct}	params
function Node(_params=nodes_base_params()) constructor {
	
	/// @func __init__(params)
	/// @param {struct}	params 
	function __init__(_params) {
		self.id		= _params.id;
		self.width	= _params.width;
		self.height = _params.height;
		self.text	= _params.text;
		self.x		= _params.x;
		self.y		= _params.y;
		
		self.xAnchor = _params.x;
		self.yAnchor = _params.y;
		
		self.theme	= _params.theme;
		self.tab	= _params.tab;
		self.childs	= _params.childs;
		self.state	= _params.state;
		
		self.xscale	= _params.xscale;
		self.yscale	= _params.yscale;
		
		self.isOpen	= _params.isOpen;
		self.focus	= _params.focus;
		
		self.surf	= -1;
		
		self.__renderHeight	= 0;
		
		NODE_COUNT++;
	}
	
	/// @func draw()
	function draw() {
		if (!surface_exists(self.surf)) {
			self.surf = surface_create(self.width, self.height + 16);
			self.render_node_box();
		}
		
		if (surface_get_width(self.surf) != self.width || surface_get_height(self.surf) != self.height + 16) {
			surface_resize(self.surf, self.width, self.height + 16);
			self.render_node_box();
		}
		
		if (self.focus) {
			draw_set_alpha(1);
			draw_set_color(self.theme.TEXT_DEFAULT);
			draw_rectangle(
				self.x - CANVAS_VIEW_X - 1,
				self.y - CANVAS_VIEW_Y - 1,
				self.x - CANVAS_VIEW_X + self.width,
				self.y - CANVAS_VIEW_Y + self.__renderHeight + 16,
				true
			);
		}
		
		var _node_alpha = ( self.state != STATE.DEFAULT ? .66 : 1 );
		draw_set_alpha(_node_alpha);
		draw_surface_part(self.surf, 0, 0, self.width, 16 + self.__renderHeight, self.x - CANVAS_VIEW_X, self.y - CANVAS_VIEW_Y);
		
		if (self.state == STATE.RESIZE) {
			draw_set_alpha((1 - _node_alpha) / 2);
			draw_set_colour(c_lime);
			draw_rectangle(self.x, self.y, self.x + self.width, self.y + self.height + 16, false);
		}
		
		draw_set_alpha(1);
	}
	
	/// @func render_node_box()
	function render_node_box() {
		var _x = 0;
		var _y = 16;
		var _w = self.width;
		var _h = self.height;
		
		surface_set_target(self.surf);
		draw_set_alpha(1);
		
		draw_set_colour(self.theme.BOX_DEFAULT);
		draw_rectangle(_x, _y, _x + _w, _y + _h, false);
		
		draw_set_colour(self.theme.BOX_DARKER);
		draw_rectangle(_x, _y - 16, _x + _w, _y, false);
		draw_line(_x, _y + _h, _x + _w, _y + _h);
	
		draw_set_colour(self.theme.BOX_HIGHLIGHT);
		draw_rectangle(_x + _w - 8, _y + _h - 8, _x + _w, _y + _h, false);
	
		draw_set_colour(self.theme.TEXT_DEFAULT);
		if (self.isOpen) {
			draw_triangle(_x + 10, _y - 13, _x + 10, _y - 5, _x + 2, _y - 5, true);
		} else {
			draw_triangle(_x + 10, _y - 9, _x + 3, _y - 5, _x + 3, _y - 13, false);
		}
		
		draw_set_font(fnt_Semibold);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text(_x + 15, _y + 2, "ID: " + self.id);
		
		draw_set_font(fnt_Default);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_ext(_x + _w/2, _y + _h/2, self.text, -1, _w - 16);
		
		surface_reset_target();
	}
	
	/// @func isHover()
	function isHover() {
		var _hover = 
		( self.isOpen
		? mouse_in_rectangle(self.x, self.y, self.x + self.width, self.y + self.height + 16)
		: mouse_in_rectangle(self.x, self.y, self.x + self.width, self.y + 16)
		);
		
		return _hover;
	}
	/// @func isHoverToggle()
	function isHoverToggle() {
		return mouse_in_rectangle(	self.x,
									self.y,
									self.x + 16,
									self.y + 16
								 );
	}	
	/// @func isHoverID()
	function isHoverID() {
		return mouse_in_rectangle(	self.x,
									self.y,
									self.x + self.width,
									self.y + 16
								 );
	}	
	/// @func isHoverResize()
	function isHoverResize() {
		return mouse_in_rectangle(	self.x + self.width - 8,
									self.y + self.height + 8,
									self.x + self.width,
									self.y + self.height + 16
								 );
	}
	
	/// @func stepEvent()
	function stepEvent() {
		switch (self.state) {
			case STATE.MOVE:
				self.x = MOUSE_GUI_X - self.xAnchor;
				self.y = MOUSE_GUI_Y - self.yAnchor;
				break;
				
			case STATE.RESIZE:
				self.width = (MOUSE_GUI_X - self.x);
				self.height = (MOUSE_GUI_Y - self.y);
				
				self.width = max(round(self.width), NODE_MIN_WIDTH);
				self.height = max(round(self.height), NODE_MIN_HEIGHT);
				
				self.__renderHeight = self.height;
				break;
				
			case STATE.TOGGLE:
				self.__renderHeight = 
					( self.isOpen
					? lerp(self.__renderHeight, self.height, .25)
					: lerp(self.__renderHeight, 0, .25)
					);
				
				if
				(self.isOpen && self.__renderHeight > self.height - 1) ||
				(!self.isOpen && self.__renderHeight < 1) {
					self.__renderHeight = ( self.isOpen ? self.height : 0 );
					self.state = STATE.DEFAULT;
				}
				break;
		}
	}
	
	/// @func endAction()
	function endAction() {
		switch (self.state) {
			default:
				state = STATE.DEFAULT;
				break;
				
			case STATE.TOGGLE:
				self.render_node_box();
				break;
		}
	}
	
	__init__(struct_merge(nodes_base_params(), _params, false));
}

/// @func	nodes_base_params()
function nodes_base_params() {
	static _node_base = {
		id		: NODE_ID_PREFIX + string(NODE_COUNT),
		width	: NODE_LAST_WIDTH,
		height	: NODE_LAST_HEIGHT,
		text	: NODE_DEFAULT_TEXT,
		x		: MOUSE_GUI_X,
		y		: MOUSE_GUI_Y,
		
		theme	: THEMES.DARK,
		tab		: TABS[| TAB_CURRENT],
		childs	: ds_list_create(),
		state	: STATE.CREATE,
		
		xscale	: 0,
		yscale	: 0,
		
		isOpen	: true,
		focus	: false,
		
		surf	: -1,
	}
	
	return _node_base;
}
