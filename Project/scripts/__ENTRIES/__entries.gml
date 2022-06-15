/// @function Entry(params)
/// @param {struct}	params 
function Entry(_params=entry_base_params()) constructor {
	/// @func	__init__(params)
	/// @param {struct}	params 
	function __init__(_params) {
		self.text		= _params.text;
		self.placeholder= _params.placeholder;
		self.label		= _params.label;
		self.x			= _params.x;
		self.xstart		= _params.x;
		self.y			= _params.y;
		self.ystart		= _params.y;
		self.width		= _params.width;
		self.height		= _params.height;
		self.minWidth	= _params.minWidth;
		self.minHeight	= _params.minHeight;
		self.maxWidth	= _params.maxWidth;
		self.maxHeight	= _params.maxHeight;
		self.fixedWidth = _params.fixedWidth;
		self.fixedHeight= _params.fixedHeight;
		self.maxChars	= _params.maxChars;
		
		self.active		= _params.active;
		self.onChange	= _params.onChange;
		self.theme		= _params.theme;
		
		self.margin		= _params.margin;
		self.font		= _params.font;
		
		self.borderVisible	= _params.borderVisible;
		self.borderWidth	= _params.borderWidth;
		
		self.longEntry	= _params.longEntry;
		self.textVAlign = _params.textVAlign;
		self.textYOffset = _params.textYOffset;
	}
	
	/// @func	draw()
	function draw() {
		self.checkSize();
		draw_set_alpha(1);
		draw_set_colour( self.isHover() || self.active ? self.theme.BOX_DARKER : self.theme.BOX_DEFAULT );
		draw_rectangle(self.x - self.margin,
					   self.y - self.margin,
					   self.x + self.width + self.margin,
					   self.y + self.height + self.margin,
					   false
					  );
					  
		draw_set_font(self.font);
		draw_set_colour(self.theme.TEXT_DEFAULT);
		draw_set_halign(fa_left);
		draw_set_valign(self.textVAlign);
		
		var _text_y;
		if (self.textVAlign == fa_top) {
			_text_y = self.textYOffset;
		} else if (self.textVAlign == fa_center) {
			_text_y = self.height / 2 + self.textYOffset;
		} else if (self.textVAlign == fa_bottom) {
			_text_y = self.height - self.textYOffset;
		}
			
		if (self.text != "") {
			draw_text(self.x + 1, self.y + _text_y, self.text);
		} else {
			draw_set_alpha(.50);
			draw_text(self.x + 1, self.y + _text_y, self.placeholder);
			draw_set_alpha(1);
		}
					  
		if (self.borderVisible) {
			draw_set_colour(self.theme.BOX_DARKER);
			for (var i = 0; i < self.borderWidth; i++) {
				draw_rectangle(self.x - self.margin - i,
							   self.y - self.margin - i,
							   self.x + self.width + self.margin + i,
							   self.y + self.height + self.margin + i,
							   true
							  );
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
	
	/// @func checkSize()
	function checkSize() {
		if !(self.fixedWidth) {
			self.width = clamp(self.width, self.minWidth, self.maxWidth);
		}
		
		if !(self.fixedHeight) {
			self.height = clamp(self.height, self.minHeight, self.maxHeight);
		}
	}
	
	/// @func	setText(kb_string, kb_last_key)
	/// @param	{string}	kb_string
	/// @param	{real}		kb_last_key
	function setText(_kb_str, _kb_last_key) {
		draw_set_font(self.font);
		switch (_kb_last_key) {
			case vk_enter:
				if (string_length(self.text) < 1) exit;
				self.active = false;
				self.onChange();
				break;
				
			default:
				if !(self.fixedWidth) {
					self.text = _kb_str;
					self.width = string_width(_kb_str);
				} else {
					var _kb_str_len = string_width(_kb_str);
					if (_kb_str_len < self.width) {
						self.text = _kb_str;
					} else {
						keyboard_string = self.text;
					}
				}
		}
	}
	
	__init__(struct_merge(entry_base_params(), _params, false));
}

/// @func	entry_base_params()
function entry_base_params() {
	var _entry_base = {
		text:		"",
		placeholder:"",
		x:			int64(0),
		y:			int64(0),
		minWidth:	0,
		minHeight:	0,
		maxWidth:	infinity,
		maxHeight:	infinity,
		width:		0,
		height:		0,
		margin:		0,
		font:		fnt_Default,
		maxChars:	-1,
		
		active:		false,
		theme:		THEME_CURRENT,
		margin:		2,
		
		onChange:	-1,
		fixedWidth:	false,
		fixedHeight: false,
		
		borderVisible:	true,
		borderWidth:	1,
		
		longEntry: false,
		textVAlign: fa_center,
		textYOffset: 1,
	}
	
	return _entry_base;
}
