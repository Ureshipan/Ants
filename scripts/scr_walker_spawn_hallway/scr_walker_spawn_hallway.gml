///@function scr_walker_spawn_hallway(walker)
///@description this will make hallways for the Walker Method
///@param walker - a walkers instance - pass 'self'
function scr_walker_spawn_hallway(argument0) {

	var walker  = argument0;

	randomize();

	var hallway_distance = irandom_range(GEN_HALLWAY_MIN, GEN_HALLWAY_MAX);

	var old_x = walker._Current_X;
	var old_y = walker._Current_Y;
			
	//Update new position and retain old
	//Make sure we don't move outside the grid
	walker._Current_X += lengthdir_x(hallway_distance, walker._Direction * 90);
	walker._Current_X = clamp(walker._Current_X, 2, walker._Total_Width - 2);
			
	walker._Current_Y += lengthdir_y(hallway_distance, walker._Direction * 90);
	walker._Current_Y = clamp(walker._Current_Y, 2, walker._Total_Height - 2);
			
	//Get Hallway size
	var hallway_size = choose(GEN_HALLWAY_WIDTH_OPTIONS);
	var sint = (hallway_size > 0) ? 1 : -1;
			
	var x1, y1, x2, y2;
	//fill the hallway
	switch(walker._Direction) {
		case 0: //Right
		case 2: //Left
			x1 = old_x;
			y1 = old_y + hallway_size;
			x2 = walker._Current_X;
			y2 = walker._Current_Y;
			break;
		case 1: //Up
		case 3: //Down
			x1 = old_x + hallway_size;
			y1 = old_y;
			x2 = walker._Current_X;
			y2 = walker._Current_Y;
			break;
	}
	ds_grid_set_region(global._grid, 
		clamp(x1, 2, walker._Total_Width - 2), 
		clamp(y1, 2, walker._Total_Height - 2), 
		clamp(x2, 2, walker._Total_Width - 2), 
		clamp(y2, 2, walker._Total_Height - 2), 
		FLOOR_HALLWAY);
				
	if(GEN_CREATE_ROOM_AFTER_HALLWAY) {
		scr_walker_spawn_room(walker);
	}


}
