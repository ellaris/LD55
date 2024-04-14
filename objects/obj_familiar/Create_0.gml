/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


max_mana = 100;
mana = max_mana;

ability_1_cd_max = game_get_speed(gamespeed_fps)/4;
ability_1_cd = 0

ability_2_cd_max = game_get_speed(gamespeed_fps)*2;
ability_2_cd = 0

time = 0;
dead = false;
sound = false;

move = 0;

image_speed = 0;
image_index = irandom(image_number-1);