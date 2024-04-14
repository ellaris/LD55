/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



if(time div game_get_speed(gamespeed_fps) > 60)
{
	if(not sound)
	{
		sound = true;
		audio_stop_sound(snd_skeleton_die);
		audio_stop_sound(snd_meteor_summon);
		audio_stop_sound(snd_meteor_hit);
		audio_play_sound(snd_end,7,false);
	}
	
	var _string = "You are VICTORIOUS !\nRandalf cleared out the hordes and now everyone is safe\nThank you for playing"
	if(dead)
		_string = "The familiar has failed\nMaybe the next one will be successful\nThank you for playing"
	draw_set_color(c_aqua);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(view_get_wport(0)/2,view_get_hport(0)/2,_string);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

