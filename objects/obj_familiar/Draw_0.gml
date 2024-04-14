/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_self()

if(room = rm_arena)
{
	draw_set_color(c_blue);
	draw_rectangle(bbox_left,bbox_top,bbox_left + (bbox_right-bbox_left)*mana/max_mana,bbox_top-4,false);

	draw_set_color(c_white)
}

//draw_text(bbox_right,bbox_top,string(time div game_get_speed(gamespeed_fps)));// + " " + string(instance_number(obj_skeleton)));
