///@function scr_place_tile(layer_id, tile_index, tile_x, tile_y)
///@description this script handles placing tiles with respect to the LAYOUT_METHOD
///@param layer_id
///@param tile_index
///@param tile_x
///@param tile_y
function scr_place_tile(argument0, argument1, argument2, argument3) {

	var layer_id = argument0;
	var tile_index = argument1;
	var tile_x = argument2;
	var tile_y = argument3;

	if(LAYOUT_METHOD == "TopDown") {
		tilemap_set(layer_id, tile_index, tile_x, tile_y);
	}else {
		var cell_x = scr_get_isometric_cell_x(tile_x, tile_y);
		var cell_y = scr_get_isometric_cell_y(tile_x, tile_y);
	
		draw_sprite(layer_id, tile_index, cell_x, cell_y);
		//tilemap_set_at_pixel(layer_id, tile_index, 528, 40);
	}




}
