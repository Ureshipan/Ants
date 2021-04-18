function scr_walker_begin_generation() {
	randomize();

	//Get the center of the grid
	var center_x = global._grid_width div 2;
	var center_y = global._grid_height div 2;

	//getting our first room's size
	var initial_room_width = irandom_range(GEN_ROOM_WIDTH_MIN, GEN_ROOM_WIDTH_MAX);
	var initial_room_height = irandom_range(GEN_ROOM_HEIGHT_MIN, GEN_ROOM_HEIGHT_MAX);

	ds_grid_set_region(global._grid, center_x - initial_room_width, center_y - initial_room_height, center_x + initial_room_width, center_y + initial_room_height, FLOOR_ROOM);

	//_walkers is our list of walkers
	//see comment above GEN_WALKER_LOOPS_MIN for a little better understand of what were doing with this.
	global._walkers = ds_list_create();
	global._walkers_allowed = true;

	//Spawn Walkers
	repeat(NUMBER_OF_INITIAL_WALKERS) {
		randomize();
	
		//for an explanation about RANDON_SPAWN_SPOT see the comment above where its declared
		if(RANDOM_SPAWN_SPOT){
			var random_x = irandom_range(-initial_room_width, initial_room_width);
			var random_y = irandom_range(-initial_room_height, initial_room_height);
		}else {
			//setting these variables to 0 means we spawn the next walker in the center of the room
			var random_x = 0;
			var random_y = 0;
		}
	
		//see comments in the ctrl_room_walker object about these variables below
		var walker = instance_create_layer((center_x - random_x)*CELL_WIDTH, (center_y - random_y)*CELL_HEIGHT, "Instances", ctrl_room_walker);
		walker._Loops = irandom_range(GEN_WALKER_LOOPS_MIN, GEN_WALKER_LOOPS_MAX);
		walker._Total_Width = global._grid_width;
		walker._Total_Height = global._grid_height;
		walker._Current_X = (center_x - random_x);
		walker._Current_Y = (center_y - random_y);
	
		ds_list_add(global._walkers, walker);
	}

	_method_ready = true;


}
