function scr_start_generator() {
	//Lets get the full area of the dungeon so we can use our Dungeon Area settings to control our size
	var dungeon_area = global._grid_width * global._grid_height;
	//(GEN_DUNGEON_AREA_MIN/MAX / 100) is getting the percentage we want to the be min and max available area filled.
	_dungeon_floor_count_min = (GEN_DUNGEON_AREA_MIN / 100) * dungeon_area;
	_dungeon_floor_count_max = (GEN_DUNGEON_AREA_MAX / 100) * dungeon_area;

	//create the main grid
	global._grid = ds_grid_create(global._grid_width, global._grid_height);
	//fill the whole grid as VOID
	ds_grid_set_region(global._grid, 0, 0, global._grid_width-1, global._grid_height-1, VOID);

	//currently we only have Walkers but Maze and Quad is coming

	switch(GEN_METHOD) {
		case "Walkers":
			scr_walker_begin_generation();
			break;
	}



}
