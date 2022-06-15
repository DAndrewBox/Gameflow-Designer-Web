/// @function Button(params)
/// @param {struct}	params 
function Button(_params=button_base_params()) constructor {
	/// @func	__init__(params)
	/// @param {struct}	params 
	function __init__(_params) {
		self.text		= _params.text;
		self.x			= _params.x;
		self.xstart		= _params.x;
		self.y			= _params.y;
		self.ystart		= _params.y;
		self.width		= _params.width + ( _params.icon != -1 && self.text != "" ? sprite_get_width(_params.icon) + (2 * _params.margin) : 0 );
		self.height		= max(_params.height, sprite_get_height(_params.icon) + (2 * _params.margin))
		self.icon		= _params.icon;
		self.iconIndex	= _params.iconIndex;
		
		self.active		= _params.active;
		self.onlyIcon	= _params.onlyIcon;
		self.onClick	= _params.onClick;
		self.theme		= _params.theme;
		
		self.margin		= _params.margin;
	}
	
	/// @func	draw()
	function draw() {
		// Set local variables
		var _x_center = self.x + self.width / 2;
		var _y_center = self.y + self.height / 2;
		
		// Draw background
		draw_set_alpha(1);
		draw_set_color( self.isHover() ? self.theme.BOX_HIGHLIGHT : self.theme.BOX_DEFAULT );
		draw_rectangle( self.x - margin,
						self.y - margin,
						self.x + self.width + margin,
						self.y + self.height + margin,
						false);
		
		draw_set_color(self.theme.TEXT_DEFAULT);
		if (self.onlyIcon) {
			// Draw only icon
			draw_set_alpha(.85);
			draw_sprite(self.icon, self.iconIndex, _x_center, _y_center);
		} else {
			draw_set_font(fnt_Bold);
			draw_set_valign(fa_center);
			
			if (self.icon == -1) {
				// Draw only text
				draw_set_halign(fa_center);
				draw_text(_x_center, _y_center, self.text);
			} else {
				// Draw icon & text
				var _icon_w = sprite_get_width(self.icon);
				draw_sprite_ext(self.icon, self.iconIndex, self.x, _y_center, 1, 1, 0, self.theme.TEXT_DEFAULT, .33);
				draw_set_halign(fa_left);
				draw_text(self.x + 4 + _icon_w, _y_center, self.text);
			}
		}
	}
	
	/// @func isHover()
	function isHover() {
		return mouse_in_rectangle(	self.x - self.margin,
									self.y - self.margin,
									self.x + self.width + self.margin,
									self.y + self.height + self.margin
								 );
	}
	
	__init__(struct_merge(button_base_params(), _params, false));
}

/// @func	button_base_params()
function button_base_params() {
	var _button_base = {
		text:		"",
		x:			int64(0),
		y:			int64(0),
		width:		0,
		height:		0,
		icon:		-1,
		iconIndex:	0,
		active:		false,
		onlyIcon:	false,
		onClick:	-1,
		theme:		THEME_CURRENT,
		margin:		0,
	}
	
	return _button_base;
}
