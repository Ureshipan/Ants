function scr_is_density_correct() {
	var non_void_count = 0;
	for(var _x = 0; _x < global._grid_width; _x++) {
		for(var _y = 0; _y < global._grid_height; _y++) {
			if(global._grid[# _x, _y] != VOID) {
				non_void_count++;
			}
		}
	}
	
	if(non_void_count >= _dungeon_floor_count_min && non_void_count <= _dungeon_floor_count_max) {
		return true;	
	}

	return false;


}
