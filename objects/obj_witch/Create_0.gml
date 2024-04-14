/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




image_speed = 0;
wand_image = 0;

hat_image = irandom(sprite_get_number(spr_witch_hat)-1);
dress_image = irandom(sprite_get_number(spr_witch_dress)-1);
hair_image = irandom(sprite_get_number(spr_witch_hair)-1);

hat_color = choose(c_white,c_aqua,c_blue,c_teal,c_navy);
dress_color = choose(c_white,c_aqua,c_blue,c_teal,c_navy);
hair_color = choose(c_white,c_aqua,c_blue,c_teal,c_navy);

head_bop = 0

rest = 0;