/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(room = rm_witch_hut)
{
	if(draw_cd > 0)
		draw_cd--;
	if(left_clicked)
		left_click_timer += 1;

	var _double_click = false;

	if(device_mouse_check_button_pressed(0, mb_left))
	{
		if(is_mobile)
		{
			if(left_clicked)
				_double_click = true;
			left_clicked = not left_clicked;
			left_click_timer = 0;
		}
		else
		{
			with obj_summonable
				selected = false;
		}
		var _s = instance_position(mouse_x,mouse_y,obj_summonable);
		if(_s)
		{
			with obj_summonable
				selected = false;
			_s.selected = true;
			obj_witch.wand_image = 1;
			obj_witch.rest = 0;
			left_clicked = false;
			audio_play_sound(snd_button_click,1,false);
		}
		inactivity = 0;
	}

	if( left_click_timer >= 30 and left_clicked and is_mobile)
	{
		with obj_summonable
			selected = false;
		left_click_timer = 0
		left_clicked = false;
	}

	if(device_mouse_check_button_pressed(0, mb_right) or _double_click)
	{
		inactivity = 0;
		obj_witch.wand_image = 2;
		obj_witch.rest = game_get_speed(gamespeed_fps)*0.3;
	
		var _s = noone;
		with obj_summonable
			if(selected)	
				_s = id;;
		if(_s)
		{
			part_particles_create(part_sys,obj_witch.bbox_right,obj_witch.y,part_type_wand_magic,5);
		
			part_particles_create(part_sys,mouse_x,mouse_y,part_type_summon_magic,4);
		
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
	if(current_step < array_length(step_advancement))
		method_call(step_advancement[current_step],[]);

	if(keyboard_check_pressed(ord("N")))
		if(current_step < array_length(step_messages)-1)
			next_step();
		
	if(current_step == 11 and not instance_exists(obj_criminal))
	{
		var _criminal = instance_create_layer(pattern_sx+surface_get_width(pattern_surface)/2,
			pattern_sy+surface_get_height(pattern_surface)/2, layer, obj_criminal);
		_criminal.speed = 0.5+irandom(5)/10;
		var _sigil = instance_create_layer(_criminal.x,_criminal.y,"Sigil",obj_summon_sigil);
		_sigil.delay = 0;
		_sigil.image_xscale = _criminal.sprite_width/_sigil.sprite_width;
		_sigil.image_yscale = _criminal.sprite_width/_sigil.sprite_width;
		audio_play_sound(snd_summon,1,false);
	}

	if(current_step == 13 and not instance_exists(obj_familiar))
	{
		var _familiar = instance_create_layer(pattern_sx+surface_get_width(pattern_surface)/2,
			pattern_sy+surface_get_height(pattern_surface)/2, layer, obj_familiar);
		var _sigil = instance_create_layer(_familiar.x,_familiar.y,"Sigil",obj_summon_sigil);
		_sigil.delay = 0;
		_sigil.image_xscale = _familiar.sprite_width/_sigil.sprite_width;
		_sigil.image_yscale = _familiar.sprite_width/_sigil.sprite_width;
		audio_play_sound(snd_summon,1,false);
	}
}

if(room == rm_main)
	if(irandom(gm_speed) == 0)
	{
		var _witch = instance_create_layer(irandom(1)*room_width,32+irandom(room_height-64),"passby",obj_witch);
		var _familiar = instance_create_layer(_witch.x + sign(_witch.x-room_width/2)*32,_witch.bbox_top+irandom(_witch.sprite_height),"passby",obj_familiar);
		_familiar.hspeed = _witch.hspeed;
		_familiar.image_xscale = sign(_familiar.hspeed);
		_witch.image_xscale = sign(_familiar.hspeed);
	}