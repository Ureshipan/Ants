if(_generator_active && _method_ready) {
	if(ds_list_empty(global._walkers)) {
		//check to make sure density is correct
		if(!scr_is_density_correct()) {
			scr_start_generator();
		}else {
			//clean up
			scr_clean_up();
			
			
			
			/////////////////////////
			// DEMO PURPOSES START //
			/////////////////////////
			///
			///Note: between DEMO START and DEMO END is where you will put your logic to draw your tiles.
			///the logic below is to help you understand how to implement 2.5D TopDown and Isometric styles
			///TopDown uses Tiling so the performance is amazing, this is where GMS shines
			///Isometric uses Objects to do the tiling so ultimately we have 'not as good' performance
			///    I've tried having 1 object draw all the isometric tiles and 1 object per tile. no difference in performance
			///    my advice is to do many little dungeons, so have 'stairs' or 'zoning' in your game if you go isometric
			
			if(LAYOUT_METHOD == "TopDown") {
				var floor_layer_id_8 = layer_tilemap_get_id("Floor_8");
				var floor_layer_id_4 = layer_tilemap_get_id("Floor_4");
				var bottomside_wall_layer_id_8 = layer_tilemap_get_id("BottomSideWalls_8");
				var bottomside_wall_layer_id_4 = layer_tilemap_get_id("BottomSideWalls_4");
				var top_wall_layer_id_8 = layer_tilemap_get_id("TopWalls_8");
				var top_wall_layer_id_4 = layer_tilemap_get_id("TopWalls_4");
		
				for(var y_ = 0;  y_ < global._grid_height; y_++) {
					for(var x_ = 0;	x_ < global._grid_width; x_++) {
						if(global._grid[# x_, y_] == FLOOR_ROOM || global._grid[# x_, y_] == FLOOR_HALLWAY) {							
							if(BIT_X == 4) {
								scr_place_tile(floor_layer_id_4, 4, x_, y_);
							}else {
								var rand_tile = choose(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 13, 14, 15);
								scr_place_tile(floor_layer_id_8, rand_tile, x_, y_);
							}
						}else if(global._grid[# x_, y_] == VOID) {
							//LETS SEE WHERE FLOORS ARE
							var north = (global._grid[# x_, y_ - 1] == FLOOR_ROOM || global._grid[# x_, y_ - 1] == FLOOR_HALLWAY);
							var south = (global._grid[# x_, y_ + 1] == FLOOR_ROOM || global._grid[# x_, y_ + 1] == FLOOR_HALLWAY);
							var west = (global._grid[# x_ - 1, y_] == FLOOR_ROOM || global._grid[# x_ - 1, y_] == FLOOR_HALLWAY);
							var east = (global._grid[# x_ + 1, y_] == FLOOR_ROOM || global._grid[# x_ + 1, y_] == FLOOR_HALLWAY);
							
							
							if(BIT_X == 4) {
								if(south){
									scr_place_tile(top_wall_layer_id_4, 2, x_, y_);
								}else if(north) {
									scr_place_tile(top_wall_layer_id_4, 9, x_, y_);
								}else if(west){
									scr_place_tile(top_wall_layer_id_4, 5, x_, y_);
								}else if(east){
									scr_place_tile(top_wall_layer_id_4, 3, x_, y_);
								}else {
									scr_place_tile(top_wall_layer_id_4, 1, x_, y_);
								}
							}else {
								var north_east = (global._grid[# x_ + 1, y_ - 1] == FLOOR_ROOM || global._grid[# x_ + 1, y_ - 1] == FLOOR_HALLWAY);
								var north_west = (global._grid[# x_ - 1, y_ - 1] == FLOOR_ROOM || global._grid[# x_ - 1, y_ - 1] == FLOOR_HALLWAY);
								var south_east = (global._grid[# x_ + 1, y_ + 1] == FLOOR_ROOM || global._grid[# x_ + 1, y_ + 1] == FLOOR_HALLWAY);
								var south_west = (global._grid[# x_ - 1, y_ + 1] == FLOOR_ROOM || global._grid[# x_ - 1, y_ + 1] == FLOOR_HALLWAY);
								
								//FUN LOGIC 
								//ULTIMATELY WERE JUST LOOKING ALROUND US TO SEE WHERE FLOORS ARE 
								//TO LAY THE CORRECT WALL ORIENTED TILE
								if(north) {
									if(east) {
										if(west) {
											if(south) {
												scr_place_tile(top_wall_layer_id_8, 25, x_, y_ - 1);
												scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
											}else {
												scr_place_tile(top_wall_layer_id_8, 24, x_, y_ - 1);
												scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
											}
										}else if(south){
												scr_place_tile(top_wall_layer_id_8, 23, x_, y_ - 1);
												scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
										} else {
											scr_place_tile(top_wall_layer_id_8, 7, x_, y_ - 1);
											scr_place_tile(top_wall_layer_id_8, 4, x_, y_);
										}
									}else if(west) {
											if(south) {
												scr_place_tile(top_wall_layer_id_8, 22, x_, y_ - 1);
												scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
											}else {
												scr_place_tile(top_wall_layer_id_8, 6, x_, y_ - 1);
												scr_place_tile(top_wall_layer_id_8, 4, x_, y_);
											}
									}else {
										scr_place_tile(top_wall_layer_id_8, 2, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
									}
								}else if(south) {
									if(east) {
										scr_place_tile(top_wall_layer_id_8, 8, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
									}else if(west) {
										scr_place_tile(top_wall_layer_id_8, 9, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
									}else {
										scr_place_tile(top_wall_layer_id_8, 2, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
									}
								}else if(west) {
									scr_place_tile(top_wall_layer_id_8, 4, x_, y_ - 1);
									scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
								}else if(east) {
									scr_place_tile(top_wall_layer_id_8, 4, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
								}else {
									if(north_east) {
										scr_place_tile(top_wall_layer_id_8, 9, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
									}else if(north_west) {
										scr_place_tile(top_wall_layer_id_8, 8, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 1, x_, y_);
									}else if(south_east) {
										scr_place_tile(top_wall_layer_id_8, 6, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 4, x_, y_);
									}else if(south_west) {
										scr_place_tile(top_wall_layer_id_8, 7, x_, y_ - 1);
										scr_place_tile(top_wall_layer_id_8, 4, x_, y_);
									}
								}
							}
						}
					}
				}
			}else { //WE ARE DOING ISOMETRIC LAYOUT				
				for(var y_ = 0;  y_ < global._grid_height; y_++) {
					for(var x_ = 0;	x_ < global._grid_width; x_++) {
						
						if(global._grid[# x_, y_] == FLOOR_ROOM || global._grid[# x_, y_] == FLOOR_HALLWAY) {
							
							instance_create_layer(
								scr_get_isometric_cell_x(x_, y_), 
								scr_get_isometric_cell_y(x_, y_),
								"Instances", obj_iso_floor);
							
						}else if(global._grid[# x_, y_] == VOID) {
							
							var north = (global._grid[# x_, y_ - 1] == FLOOR_ROOM || global._grid[# x_, y_ - 1] == FLOOR_HALLWAY);
							var south = (global._grid[# x_, y_ + 1] == FLOOR_ROOM || global._grid[# x_, y_ + 1] == FLOOR_HALLWAY);
							var west = (global._grid[# x_ - 1, y_] == FLOOR_ROOM || global._grid[# x_ - 1, y_] == FLOOR_HALLWAY);
							var east = (global._grid[# x_ + 1, y_] == FLOOR_ROOM || global._grid[# x_ + 1, y_] == FLOOR_HALLWAY);
							
							if(north || south || east || west) {
								instance_create_layer(
									scr_get_isometric_cell_x(x_, y_), 
									scr_get_isometric_cell_y(x_, y_),
									"Instances", obj_iso_wall);
							}
						}
					}
				}
			}
			
			///////////////////////
			// DEMO PURPOSES END //
			///////////////////////
			
			
			_generator_active = false;
		}
	}
}
