// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function ui_button_move_hut(){
	room_goto(rm_witch_hut)
}

function ui_slide_music_change(){
	obj_control.music_volume = value;
	update_volume();
}

function ui_slide_sound_change(){
	obj_control.sound_volume = value;
	update_volume();
	if(not audio_is_playing(snd_summon))
		audio_play_sound(snd_summon,3,false);
}

function update_volume(){
	audio_group_set_gain(audiogroup_default, obj_control.music_volume, 0)
	audio_group_set_gain(audiogroup_sfx, obj_control.sound_volume, 0)
}