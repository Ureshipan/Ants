function scr_get_isometric_cell_x(argument0, argument1) {
	var tile_x = argument0;
	var tile_y = argument1;

	var cell_x = tile_x * (CELL_WIDTH/2) - tile_y * (CELL_WIDTH/2)
	cell_x += room_width * .5;

	return cell_x;


}
