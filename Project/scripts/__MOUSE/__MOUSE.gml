/// @function	mouse_in_rectangle(x1, y1, x2, y2)
///	@param	{real}	x1
///	@param	{real}	y1
///	@param	{real}	x2
///	@param	{real}	y2
function mouse_in_rectangle(_x1, _y1, _x2, _y2) {		
	return bool(point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y, _x1, _y1, _x2, _y2));
}
