/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




image_speed = 0;
wand_image = 0;

hat_image = irandom(sprite_get_number(spr_witch_hat)-1);
dress_image = irandom(sprite_get_number(spr_witch_dress)-1);
hair_image = irandom(sprite_get_number(spr_witch_hair)-1);

hat_color = array_shuffle(obj_control.witch_palette)[0];
dress_color = array_shuffle(obj_control.witch_palette)[0];
hair_color = array_shuffle(obj_control.witch_palette)[0];

head_bop = 0

rest = 0;

if(room == rm_main)
	hspeed = sign(room_width/2-x)*(1+irandom(10)/10);