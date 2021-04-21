///@function scr_place_tile(layer_id, tile_index, tile_x, tile_y)
///@description this script handles placing tiles with respect to the LAYOUT_METHOD
///@param layer_id
///@param tile_index
///@param tile_x
///@param tile_y
function scr_place_tile(argument0, argument1, argument2, argument3) {

	var layer_id = argument0;
	var tile_x = argument2;
	var tile_y = argument3;

	if layer_id != "Floor"{instance_create_depth(tile_x*32, tile_y*32, 0, Plan_hallway)}
	else{instance_create_depth(tile_x*32, tile_y*32, 0, Build_block)}




}
