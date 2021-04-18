///@function scr_walker_spawn_room(walker)
///@description this will make rooms for the Walker Method
///@param walker - a walkers instance - pass 'self'
function scr_walker_spawn_room(argument0) {

	var walker  = argument0;

	var random_width = irandom_range(GEN_ROOM_WIDTH_MIN, GEN_ROOM_WIDTH_MAX);
	var random_height = irandom_range(GEN_ROOM_HEIGHT_MIN, GEN_ROOM_HEIGHT_MAX);

	ds_grid_set_region(global._grid, 
		clamp(walker._Current_X - random_width, 2, walker._Total_Width - 2), 
		clamp(walker._Current_Y - random_height, 2, walker._Total_Height - 2), 
		clamp(walker._Current_X + random_width, 2, walker._Total_Width - 2), 
		clamp(walker._Current_Y + random_height, 2, walker._Total_Height - 2), 
		FLOOR_ROOM);
	
	walker._Last_Room_Width = random_width;
	walker._Last_Room_Height = random_height;


}
