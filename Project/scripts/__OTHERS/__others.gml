/// @func	alert(msg)
/// @param	{any}	msg
function alert(_msg) {
	show_message(_msg);
}

/// @func	toggle_top_menu()
function toggle_top_menu() {
	o_Menu_Top.MENU_IS_OPEN = !o_Menu_Top.MENU_IS_OPEN;
	o_Menu_Top.MENU_YOFF_TO = ( o_Menu_Top.MENU_IS_OPEN ? 0 : -64 );
	o_Menu_Top.MENU_BUTTONS[| 6].iconIndex = !o_Menu_Top.MENU_IS_OPEN;
}

/// @func	toggle_sidemodal_menu()
function toggle_sidemodal_menu() {
	o_Menu_SideModal.MENU_IS_OPEN = !o_Menu_SideModal.MENU_IS_OPEN;
	o_Menu_SideModal.MENU_XOFF_TO = ( o_Menu_SideModal.MENU_IS_OPEN ? -SIDE_MODAL_MIN_W : -16 );
	o_Menu_SideModal.MENU_BUTTONS[| 0].iconIndex = o_Menu_SideModal.MENU_IS_OPEN;
}