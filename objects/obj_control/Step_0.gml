/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




if(device_mouse_check_button_pressed(0, mb_left))
{
	with obj_summonable
		selected = false;
	var _s = instance_position(mouse_x,mouse_y,obj_summonable);
	if(_s)
	{
		_s.selected = true;
		obj_witch.image_index = 1;
		obj_witch.rest = 0;
	}
	inactivity = 0;
}

if(device_mouse_check_button_pressed(0, mb_right))
{
	inactivity = 0;
	obj_witch.image_index = 2;
	obj_witch.rest = game_get_speed(gamespeed_fps)*0.8;
	
	var _s = noone;
	with obj_summonable
		if(selected)	
			_s = id;;
	if(_s)
	{
		var _cancel = false;
		var _unselect = true;
		var _sigil_delay = 0
		var _delay = game_get_speed(gamespeed_fps) * _s.summon_dificulty;
		if(object_is_ancestor(_s.object_index,obj_summoning))
		{
			_delay = 0;
			_unselect = false;
			_sigil_delay = game_get_speed(gamespeed_fps);
			if(is_array(_s.conjure_object_type) and array_length(_s.conjure_object_type) == 0)
				_cancel = true;
		}
		if( not _cancel)
		{
			_s.summon(mouse_x,mouse_y,_delay,_sigil_delay);
			if(_unselect)
				_s.selected = false;
		}
	}
	
	
	
}

inactivity += 1;
//if(inactivity >= inactivity_treshold)
//{
//	if(current_step < array_length(step_messages)-1)
//		current_step += 1;
//	inactivity = 0;
//}

// step advancement
if(current_step < array_length(step_advancement)-1)
	method_call(step_advancement[current_step],[]);

if(keyboard_check_pressed(ord("N")))
		current_step += 1;
		
if(current_step == 11 and not instance_exists(obj_criminal))
{
	var _criminal = instance_create_layer(pattern_sx+surface_get_width(pattern_surface)/2,
		pattern_sy+surface_get_height(pattern_surface)/2, layer, obj_criminal);
	_criminal.speed = 0.5+irandom(5)/10;
}

if(current_step == 13 and not instance_exists(obj_familiar))
{
	var _familiar = instance_create_layer(pattern_sx+surface_get_width(pattern_surface)/2,
		pattern_sy+surface_get_height(pattern_surface)/2, layer, obj_familiar);
}