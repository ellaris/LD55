/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(room = rm_witch_hut)
{
	var _remove_candles = 1+irandom(3);
	var _remove_herbs = 1+irandom(2);
	
	recalculate_lighting();
	
	while(_remove_candles > 0)
	{
		with instance_find(obj_candle,irandom(instance_number(obj_candle)-1))
			instance_destroy();
		_remove_candles--;
	}
	
	while(_remove_herbs > 0)
	{
		with instance_find(obj_herb,irandom(instance_number(obj_herb)-1))
			instance_destroy();
		_remove_herbs--;
	}
}

if(room == rm_arena)
{
	audio_stop_sound(music_track);
	music_track = audio_play_sound(snd_music_battle,2,true);
}

if(is_mobile)
{
	view_set_wport(0,500);
	view_set_hport(0,150);
}
