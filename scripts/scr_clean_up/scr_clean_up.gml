function scr_clean_up() {
	repeat(3) {
		for(var y_ = 1;  y_ < global._grid_height - 1; y_++) {
			for(var x_ = 1;	x_ < global._grid_width - 1; x_++) {
				if(global._grid[# x_, y_] == VOID) {
					var north = (global._grid[# x_, y_ - 1] != VOID);
					var south = (global._grid[# x_, y_ + 1] != VOID);
					var south2 = (global._grid[# x_, y_ + 2] != VOID);
					var west = (global._grid[# x_ - 1, y_] != VOID);
					var east = (global._grid[# x_ + 1, y_] != VOID);
					var west2 = (global._grid[# x_ - 2, y_] != VOID);
					var east2 = (global._grid[# x_ + 2, y_] != VOID);
					var north_east = (global._grid[# x_ + 1, y_ - 1] != VOID);
					var north_west = (global._grid[# x_ - 1, y_ - 1] != VOID);
					var south_east = (global._grid[# x_ + 1, y_ + 1] != VOID);
					var south_west = (global._grid[# x_ - 1, y_ + 1] != VOID);
													
					//get rid of thin voids
					if(north && south || west && east) {
						global._grid[# x_, y_] = FLOOR_ROOM;	
					}
							
					//get rid of void crosses
					if(!north && !east && !west && !south && north_east && south_west) {
						global._grid[# x_ + 1, y_ - 1] = VOID;
						global._grid[# x_ - 1, y_ + 1] = VOID;
					}
							
					if(!north && !east && !west && !south && north_west && south_east) {
						global._grid[# x_ - 1, y_ - 1] = VOID;
						global._grid[# x_ + 1, y_ + 1] = VOID;
					}
							
					//get rid of 2 void rect's where their corners touch
					if(north && east && !south && !west && !south_west && !north_east) {
						global._grid[# x_, y_ - 1] = VOID;
						global._grid[# x_ + 1, y_] = VOID;
					}
							
					if(north && west && !south && !east && !south_east && !north_west) {
						global._grid[# x_, y_ - 1] = VOID;
						global._grid[# x_ - 1, y_] = VOID;
					}
							
					if(south && west && !north && !east && !north_east && !south_west) {
						global._grid[# x_, y_ + 1] = VOID;
						global._grid[# x_ - 1, y_] = VOID;
					}
							
					if(south && east && !north && !west && !north_west && !south_east) {
						global._grid[# x_, y_ + 1] = VOID;
						global._grid[# x_ + 1, y_] = VOID;
					}
							
				}
			}
		}
	}


}
