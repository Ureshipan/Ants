randomize();

//ALL THESE VALUES GET OVERWRITTEN WHEN
//THE WALKER IS SPAWNED

//the number of times this walker will make room/hallway
_Loops = 10;

//used for changing the walkers direction
_Direction = irandom(3); //Right = 0, Up = 1, Left = 2, Bottom = 3

//you can actually play with this value
//0 = 100% chance that the walker will change directions
//1 = 50% chance that the walker will change directions
//2 = 33% chance that the walker will change directions
//etc
_Odds = 1;

//this holds this walkers position in the global._walker_list
//so when this walker is done, it removes itself the list
_List_Position = noone;


_Total_Width = -1;
_Total_Height = -1;
_Current_X = -1;
_Current_y = -1;

//these values are used for spawning a child walker in a random position
//only if the setting RANDOM_SPAWN_SPOT is true
_Last_Room_Width = -1;
_Last_Room_Height = -1;

