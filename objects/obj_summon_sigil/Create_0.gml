/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

raise = 16;
delay = 0

spin_side = choose(-1,1);
spin_side *= ( 1+irandom(10)/10);
image_angle	= spin_side;
image_index = irandom(image_number-1);
image_speed = 0;
anim_speed = 1 / game_get_speed(gamespeed_fps);

life = 1 * game_get_speed(gamespeed_fps);
