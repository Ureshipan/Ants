if(global._grid != noone) {
	//see comment about _Loops in Create Event
	repeat(_Loops) {
		randomize();
		
		//see comments about WALKER_SPAWN_ROOMS
		if(WALKER_SPAWN_ROOMS) {
			if(irandom(1) == 1) { // 0 == room
				scr_walker_spawn_room(id);
			}else { // 1 == hallway
				scr_walker_spawn_hallway(id);
			}
		}else {
			scr_walker_spawn_hallway(id);
		}
		
		//see comment about _Odds in Create Event
		if(irandom(_Odds) == _Odds) {
			_Direction = irandom(3);
		}
	}
	
	//get the position of this walker to remove it since were done with it
	_List_Position =  ds_list_find_index(global._walkers, id);
	ds_list_delete(global._walkers, _List_Position);
	
	//_walkers_allowed is a boolean variable
	//when we've added too many walkers to the list we set flag to false
	//preventing anymore new child walkers to be spawned
	if(global._walkers_allowed) {
		if(ds_list_size(global._walkers) >= GEN_MAX_WALKERS) {
			global._walkers_allowed = false;
		}else {
			var new_walkers = irandom_range(GEN_NEW_WALKERS_MIN, GEN_NEW_WALKERS_MAX);
			
			repeat(new_walkers) {
				scr_walker_spawn(id);
			}
		}
	}
	
	instance_destroy();

}