/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


gpu_set_blendmode_ext(bm_src_alpha,bm_inv_dest_colour);
draw_sprite(sprite_index,image_index,x,y+shadow_y);
gpu_set_blendmode(bm_normal);


// Inherit the parent event
event_inherited();

