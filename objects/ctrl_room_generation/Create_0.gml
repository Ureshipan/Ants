//What is the Width and Height of your tiles
//FOR DEMO
//TopDown: Height = 32
//Isometric: Height = 16
#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32

//DEMO ONLY 
//i use this to demostrate different tilesets 
//tilesets with corner pieces and ones without
#macro BIT_X 4

//Plans for future or you can use this
//Think about why you might want to know if the floor is apart of a Room or Hallway?
//Do you want to put in Enemies after you build dungeon? maybe enemies only go in rooms
//Do you want to spawn treasure in Rooms or Hallways?
#macro FLOOR_ROOM -50
#macro FLOOR_HALLWAY -51

//this is the default value of the grid spots and used to determine walls
#macro VOID 1

//LAYOUT METHOD
//Options: TopDown, Isometric
#macro LAYOUT_METHOD "TopDown"

//Generation Method
//---Options---
//Current: Walkers
//Future: Maze and Quad
//Walkers is defintely the most random looking if you use less controlled values below
//    note you can make Organic looking maps (Caves) and Non-Organic looking maps (Dungeons/Room w/ Hallways)
//Maze is a more modular approach to generation. for example look up articles on Diablo 3 map generation
//Quads is doing rooms and hallways in a more non-organic approach. Think about a building. no space/gaps between spaces. Hotline Miami is a good example
#macro GEN_METHOD "Walkers"

///////////////////////////
// WALKER SETTINGS START //
///////////////////////////

//How many Walkers do you want to spawn at the start of Generations?
#macro NUMBER_OF_INITIAL_WALKERS 5

//When a Walker is "walking" it performs 1 of 2 tasks
// - Make a Room 
// - Make a Hallway
//the Min and Max has to due with telling a new Walker how many times it will perform a Task
//it uses the rand_range method to tell the walker to loop X times
//Example: rand_range(2, 3) with an output of 3
//First - Hallway, Second - Hallway, Third - Room
#macro GEN_WALKER_LOOPS_MIN 2
#macro GEN_WALKER_LOOPS_MAX 3

//These Min and Max values are used in a rand_range
//once a Walker is finished its "Loops" see above and also see the _Loops variable on the ctrl_room_walker
//we can spawn more child walkers
//use these values to control how many
#macro GEN_NEW_WALKERS_MIN 1
#macro GEN_NEW_WALKERS_MAX 5

//Ok this is an interesting settings
//Max Walkers really means that when I have X number of walkers currently running dont spawn more child walkers
//Its how we stop the generation from going on forever.
//Definitely a settings to play with.
#macro GEN_MAX_WALKERS 70

//Lets think about the general idea of a 'walker' 
//A Walker - is something that moves forward in a certain direction by a given amount. <-- kind of sounds like a hallway, right?
//Well this setting allows a walker to just spawn and 
#macro WALKER_SPAWN_ROOMS true

//This setting tells the walker...
//if you just made a hallway, then either immediately spawn a Room or just keep iterating
//Keep this to false and WALKER_SPAWN_ROOMS to false if you just want a bunch of hallway/corridors 
#macro GEN_CREATE_ROOM_AFTER_HALLWAY false 
 
//Do we want to spawn the child walkers at a random spot in the last room?
//if false, child walker is spawned in center
#macro RANDOM_SPAWN_SPOT false
/////////////////////////
// WALKER SETTINGS END //
/////////////////////////

//Random Range Mins and Maxs

// the next 4 settings is all about randomizing room sizes
#macro GEN_ROOM_WIDTH_MIN 2
#macro GEN_ROOM_WIDTH_MAX 6
#macro GEN_ROOM_HEIGHT_MIN 2
#macro GEN_ROOM_HEIGHT_MAX 6

//if we are making a hallway, then what are our min and max lengths a hallway can be
#macro GEN_HALLWAY_MIN 15
#macro GEN_HALLWAY_MAX 35

//Width of a hallway is an interesting setting
//This setting is used in a choose() method, hence why we use a comma delimited set of integers here
//a hallway is always at least 1 wide.
//if you include 0, you are ok with a 1 tile wide hallway
//using negative vs positive just says whether or not it expands up/down or left/right
#macro GEN_HALLWAY_WIDTH_OPTIONS -2, -1, 1, 2 

//Important Note: The value you put here is considered as a Percentage
//Min and Max Dungeon Area Settings are used to make sure you get
//   a dungeon 
#macro GEN_DUNGEON_AREA_MIN 0
#macro GEN_DUNGEON_AREA_MAX 150


//Generation Important Variables - Default values
global._grid = noone;
global._walkers = noone;
global._grid_width = room_width div CELL_WIDTH;
global._grid_height = room_height div CELL_HEIGHT;
global._walkers_allowed = false;

_generator_active = true;
_method_ready = false;

scr_start_generator();
