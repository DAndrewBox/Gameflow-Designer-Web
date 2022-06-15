/// @description Nodes stuff
if (o_Menu_SideModal.MENU_IS_OPEN) exit;
var _mb_press_left = mouse_check_button_pressed(mb_left);
var _mb_release_left = mouse_check_button_released(mb_left);

var _node;
for (var i = 0; i < ds_list_size(NODES); i++) {
	_node = NODES[| i];
	
	if (_mb_press_left) {
		if (_node.state != STATE.TOGGLE) {
			if (_node.isHover()) {
				_node.focus = true;
				
				if (_node.isHoverToggle()) {
					_node.state = STATE.TOGGLE;
					_node.isOpen = !_node.isOpen;
				} else if (_node.isHoverID()) {
					_node.state = STATE.MOVE;
					_node.xAnchor = MOUSE_GUI_X - _node.x;
					_node.yAnchor = MOUSE_GUI_Y - _node.y;
				} else if (_node.isHoverResize()) {
					if (_node.isOpen) {
						_node.state = STATE.RESIZE;
					}
				} else {
					if (_node.isOpen) {
						// TODO: Show modal
					}
				}
				break;
			} else {
				_node.focus = false;
			}
		}
	}
	
	_node.stepEvent();
	
	if (_mb_release_left) {
		_node.endAction();
		break;
	}
}
