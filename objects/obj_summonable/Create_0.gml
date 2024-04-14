/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

selected = false;

summon_x = x;
summon_y = y;
summon_delay = noone;

summon_dificulty = 2;

summon_callback = undefined;

teleport_callback = undefined;

summon = function(_sx, _sy, _delay = summon_dificulty * game_get_speed(gamespeed_fps), _sigil_delay = 0)
{
	var _sigil = instance_create_layer(x,bbox_bottom,layer,obj_summon_sigil);
	_sigil.delay = _sigil_delay+_delay/2;
	_sigil.raise = bbox_bottom-bbox_top;
	_sigil.image_xscale = sprite_width/16;
	_sigil.image_yscale = sprite_height/16;
	summon_delay = _delay;
	summon_x = _sx;
	summon_y = _sy;
	
	audio_play_sound(snd_sigil,2,false);
	
	repeat sprite_width div 4
		part_particles_create(obj_control.part_sys,x-sprite_width/2+irandom(sprite_width),bbox_bottom,obj_control.part_type_summon_magic,1);
	
}

teleport = function()
{
	x = summon_x;
	y = summon_y;
	var _sigil = instance_create_layer(x,bbox_bottom,"Sigil",obj_summon_sigil);
	summon_delay = noone;
	
	repeat sprite_width div 4
		part_particles_create(obj_control.part_sys,x-sprite_width/2+irandom(sprite_width),bbox_bottom,obj_control.part_type_summon_magic,1);
	
	audio_play_sound(snd_summon,3,false);
	
	if(not is_undefined(teleport_callback))
		method_call(teleport_callback,[]);
}

summon_callback = teleport;