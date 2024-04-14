/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


//draw_self();
var _head_bop_offset = sin(head_bop/game_get_speed(gamespeed_fps)*3);
var _size_pixel_ratio = 1/(bbox_bottom-bbox_top)

draw_sprite_ext(spr_witch_head,0,x,y+abs(_head_bop_offset),image_xscale,image_yscale,image_angle,c_white,image_alpha);
draw_sprite_ext(spr_witch_hair,hair_image,x,y+abs(_head_bop_offset),image_xscale,image_yscale,image_angle,hair_color,image_alpha);
draw_sprite_ext(spr_witch_body,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha);
draw_sprite_ext(spr_witch_dress,dress_image,x,y,image_xscale,image_yscale+_size_pixel_ratio*(0.5-_head_bop_offset),image_angle,dress_color,image_alpha);
draw_sprite_ext(spr_witch_hat,hat_image,x,y+abs(_head_bop_offset),image_xscale,image_yscale,image_angle,hat_color,image_alpha);




draw_sprite_ext(spr_wand,wand_image,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

