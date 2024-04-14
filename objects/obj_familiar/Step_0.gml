/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(room = rm_arena)
{
	
	time++;

	if(time div game_get_speed(gamespeed_fps) > 60)
	{
		var _t = time mod game_get_speed(gamespeed_fps);
		with(obj_skeleton)
			if( x < _t/game_get_speed(gamespeed_fps)*room_width)
				instance_destroy(id,false);
	}
	if(time div game_get_speed(gamespeed_fps) >= 68)
		game_restart();
		//room_goto(rm_main);

	var _hkey = keyboard_check(ord("D"))-keyboard_check(ord("A"));
	var _vkey = keyboard_check(ord("S"))-keyboard_check(ord("W"));

	var _dir = point_direction(0,0,_hkey,_vkey);

	if(_hkey != 0 or _vkey != 0)
	{
		x = x + lengthdir_x(1.5,_dir);
		y = y + lengthdir_y(1.5,_dir);
	}
	var _left = mouse_check_button_pressed(mb_left);
	var _right = mouse_check_button_pressed(mb_right);

	if(mana < max_mana)
	{
		mana = clamp(mana+ 15/game_get_speed(gamespeed_fps),0,max_mana)	
	}

	if(_left and mana >= 8 and ability_1_cd == 0)
	{
		ability_1_cd = ability_1_cd_max;
		mana -= 8;
	
		// summon a meteor
		instance_create_layer(mouse_x,mouse_y,layer,obj_meteor);
	
		if(irandom(4) == 0)
		{
			var _extra = instance_create_layer(mouse_x+irandom(64)-32,mouse_y+irandom(64)-32,layer,obj_meteor);
			_extra.offset *= 2;
		}
	}

	if(_right and mana >= 50 and ability_2_cd == 0)
	{
		ability_2_cd = ability_2_cd_max;
		mana -= 50;
	
		var _offset = 1;
		repeat 30
		{
			var _meteor = instance_create_layer(irandom(room_width),irandom(room_height),layer,obj_meteor);
			_meteor.offset *= _offset;
			_offset += 0.2;
		}
	
		//// summon an explosion
		//with(obj_skeleton)
		//	instance_destroy();
		//with(obj_skeleton)
		//{
		//	x += irandom(32)-16;
		//	y += irandom(32)-16;
		//}
	}

	if(ability_1_cd > 0)
		ability_1_cd -= 1;
	if(ability_2_cd > 0)
		ability_2_cd -= 1;
	
}