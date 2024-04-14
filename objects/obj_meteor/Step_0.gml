/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


offset -= 8;

if(offset < 300 and not sound)
{
	audio_play_sound(snd_meteor_summon, 1, false);
	sound = true;
}


if(offset <= 0)
{
	audio_play_sound(snd_meteor_hit, 3, false);
	with obj_skeleton
		if(place_meeting(x,y,other))
			instance_destroy();
	instance_destroy();	
}

