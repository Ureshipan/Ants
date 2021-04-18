///@function scr_walker_spawn_room(walker)
///@description this will make rooms for the Walker Method
///@param walker - a walkers instance - pass 'self'
function scr_walker_spawn(argument0) {

	var current_walker = argument0;

	randomize();
				
	if(RANDOM_SPAWN_SPOT){
		if(current_walker._Last_Room_Width < 0 && current_walker._Last_Room_Height < 0) {
			var start_x = clamp(current_walker._Current_X, 2, current_walker._Total_Width - 2);
			var start_y = clamp(current_walker._Current_Y, 2, current_walker._Total_Height - 2);
		}else {
			var random_x = irandom_range(-current_walker._Last_Room_Width, current_walker._Last_Room_Width);
			var random_y = irandom_range(-current_walker._Last_Room_Height, current_walker._Last_Room_Height);
						
			var start_x = clamp((current_walker._Current_X - random_x), 2, current_walker._Total_Width - 2);
			var start_y = clamp((current_walker._Current_Y - random_y), 2, current_walker._Total_Height - 2);
		}
	}else {
		var start_x = clamp(current_walker._Current_X, 2, current_walker._Total_Width - 2);
		var start_y = clamp(current_walker._Current_Y, 2, current_walker._Total_Height - 2);
	}
				
	var walker = instance_create_layer(start_x * CELL_WIDTH, start_y * CELL_HEIGHT, "Instances", ctrl_room_walker);
	walker._Loops = irandom_range(GEN_WALKER_LOOPS_MIN, GEN_WALKER_LOOPS_MAX);
	walker._Total_Width = global._grid_width;
	walker._Total_Height = global._grid_height;
	walker._Current_X = start_x;
	walker._Current_Y = start_y;
	
	ds_list_add(global._walkers, walker);


}
