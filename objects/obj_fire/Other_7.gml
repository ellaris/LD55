/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


var _candle = instance_place(x,y,obj_candle);
if(_candle)
{
	_candle.lit = true;
	_candle.sprite_index = spr_candle_lit;
	obj_control.recalculate_lighting();
	audio_play_sound(snd_fire,3,false);
	
	repeat 5
		part_particles_create(obj_control.part_sys,x+irandom(sprite_width/2)-sprite_width/4,bbox_bottom,obj_control.part_type_fire,1);
}

instance_destroy();