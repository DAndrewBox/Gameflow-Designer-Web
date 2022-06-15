/// @description Setup variables
depth = 0;

#region Timers
t_check_display_size = 0;
#endregion

NODES[| 0] = new Node({x: WINDOW_WIDTH / 2 - NODE_LAST_WIDTH / 2, 
					   y: WINDOW_HEIGHT / 2 - NODE_LAST_HEIGHT / 2,
					   isOpen: false,
					  });
