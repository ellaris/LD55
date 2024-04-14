/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(shadow_y != 0)
{
	//gpu_set_blendmode_ext(bm_src_alpha,bm_inv_src_alpha);
	draw_sprite_ext(sprite_index,image_index,x,y+shadow_y,1,1,0,c_black,1);
	//gpu_set_blendmode(bm_normal);
}


// Inherit the parent event
event_inherited();

