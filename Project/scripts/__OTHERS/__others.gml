/// @func	struct_merge(struct1, struct2, shared)
/// @param	{struct}	struct1
/// @param	{struct}	struct2
/// @param	{bool}		shared
/// @author	u/MD__Wade (Reddit)
function struct_merge(primary, secondary, shared)	{
	var _ReturnStruct = primary;
	
	if (shared)	{
		var _PropertyNames = variable_struct_get_names(primary);
		for (var i = 0; i < array_length(_PropertyNames); i ++)	{
			if (variable_struct_exists(secondary, _PropertyNames[i]))	{
				variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
			}
		}
	}	else	{
		var _PropertyNames = variable_struct_get_names(secondary);
		for (var i = 0; i < array_length(_PropertyNames); i ++)	{
			variable_struct_set(_ReturnStruct, _PropertyNames[i], variable_struct_get(secondary, _PropertyNames[i]));
		}
	}
	return _ReturnStruct;
}

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