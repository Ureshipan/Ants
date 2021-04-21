if global.build_radius <= sqr((4800 - x) * (4800 - x) + (4800 - y) * (4800 - y))
{if place_meeting(x, y, Build_block){need_clean = true}
else{need_clean = false}}
else
{if place_meeting(x, y, Build_block){need_build = false}
else{need_build = true}}

alarm[0] = 100