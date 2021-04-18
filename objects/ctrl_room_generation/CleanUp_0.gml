/// @description JUST DESTROYING THE GRID
// You can write your code in this editor
if(global._grid != noone) {
	ds_grid_destroy(global._grid);
}

if(GEN_METHOD == "Walkers") {
	if(global._walkers != noone){
		ds_list_destroy(global._walkers);
	}
}