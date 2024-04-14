/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//draw_self()

var _movement_squash = (1-sin(move/(obj_control.gm_speed*0.1))*0.1);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,_movement_squash*image_yscale,image_angle,image_blend,image_alpha);


if(room = rm_arena and not dead)
{
	draw_set_color(c_blue);
	draw_rectangle(bbox_left,bbox_top,bbox_left + (bbox_right-bbox_left)*mana/max_mana,bbox_top-4,false);

	draw_set_color(c_white)
}
//draw_text(bbox_right,bbox_top,string(time div game_get_speed(gamespeed_fps)));// + " " + string(instance_number(obj_skeleton)));
