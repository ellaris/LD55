/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_light_circle = function(_o = noone, _x, _y, _r, _a, _m = 1){
	for(var _xx = -_r*_m; _xx < _r*_m;_xx++)
		for(var _yy = -_r*_m; _yy < _r*_m; _yy++)
		{
			var _dist = point_distance(0,0,_xx,_yy);
			if(_dist < _r*_m)
			{
				draw_set_alpha(_a * (_r*_m-_dist)/_r*_m)
				var _dx = _xx;
				var _dy = _yy;
				if(_o)
				{
					_dx += _o.x*_m;
					_dy += _o.y*_m;
				}
				else
				{
					_dx += _x*_m;
					_dy += _y*_m;
				}
				draw_point(_dx, _dy);
			}
		}
}

recalculate_lighting = function(){
	var _resx = view_get_wport(0)/room_width;
	var _resy = view_get_hport(0)/room_height;
	
	surface_set_target(surface_lighting);
	draw_clear_alpha(c_black,0.2);
	gpu_set_blendmode(bm_subtract);
	with obj_fireplace
		obj_control.draw_light_circle(id,0,0,sprite_width*1.5,0.5,_resx)
	with obj_witch
		obj_control.draw_light_circle(id,0,0,sprite_width*2,0.6,_resx)
	with obj_candle
		if(lit)
			obj_control.draw_light_circle(id,0,0,sprite_width*4*image_xscale,0.5,_resx)
	//obj_control.draw_light_circle(noone, mouse_x, mouse_y,128,1.2,_resx)
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_set_alpha(1)
	
}

if(room == rm_witch_hut)
{
	
	
	if(not surface_exists(pattern_surface))
		pattern_surface = surface_create(128,128);
	draw_surface(surface_lighting,0,0);
	
	// draw message
	var _message = step_messages[current_step];
	var _padding = 12;
	var _mh = string_height_ext(_message,font_height,messagebox_width-_padding*2);
	
	draw_set_color(c_white);
	if(inactivity_cap)
	{
		draw_rectangle(messagebox_x,messagebox_y-_padding,messagebox_x+messagebox_width*inactivity/inactivity_cap,messagebox_y-_padding*2,false)
		draw_rectangle(messagebox_x,messagebox_y-_padding,messagebox_x+messagebox_width,messagebox_y-_padding*2,true)	
	}
	
	draw_sprite_stretched(spr_messagebox,0,messagebox_x,messagebox_y,messagebox_width,_mh+_padding*2)
	
	draw_text_ext(messagebox_x+_padding,messagebox_y+_padding,_message,font_height,messagebox_width-_padding*2);
	
	//show_debug_message(string(view_get_wport(0)-128) + " " +string(view_get_hport(0)-64)+ " " + string(view_current))
	if(draw_pattern and current_step == 1)
	{
		var _statx = view_get_wport(0)-128;
		var _staty = view_get_hport(0)-64-16;
		var _str = "";
		var _current_text  = "";
		
		_current_text = "Fullness: "
		draw_text(_statx+string_width(_str),_staty,_current_text);
		_str += _current_text;
		
		if(pattern_fullness >= 0.88)
			draw_set_color(c_green);
		
		_current_text = string(round(pattern_fullness*100)) + "%"
		draw_text(_statx+string_width(_str),_staty,_current_text);
		_str += _current_text;
		
		//_current_text = string(round(pattern_fullness*100)) + "%"
		//draw_text(_statx+string_width(_str),_staty,_current_text);
		//_str += _current_text;
		draw_set_color(c_white)
		_str = "";
		_staty += font_height;
		
		_current_text = "Accuracy: "
		draw_text(_statx+string_width(_str),_staty,_current_text);
		_str += _current_text;
		
		if(pattern_score <= 0.92)
			draw_set_color(c_red);
		
		_current_text = string(round(pattern_score*100)) + "%"
		draw_text(_statx+string_width(_str),_staty,_current_text);
		_str += _current_text;
		
		draw_set_color(c_white);
		
		//_current_text = string(round(pattern_fullness*100)) + "%"
		//draw_text(_statx+string_width(_str),_staty,_current_text);
		//_str += _current_text;
		
		
		//draw_text(_statx, _staty, string("Fullness: {0}%\nAccuracy: {1}%", round(pattern_fullness*100), round(pattern_score*100)));
	}
	
	if(current_step == 4)
	{
		var _statx = view_get_wport(0)-128;
		var _staty = view_get_hport(0)-64-16;
		var _str = string("Gold coins: {0}/15",instance_number(obj_coin));
		draw_text(_statx,_staty,_str);
	}
			
}

if(room == rm_arena)
{
	draw_set_color(c_aqua);
	draw_text(32,32,string(obj_familiar.time div gm_speed));	
}


if(room == rm_customize)
{
	var _xcenter= view_get_wport(0)/2;
	var _ycenter  = view_get_hport(0)/2;
	var _xx = _xcenter-128;
	var _yy = _ycenter;
	
	//var _head_bop_offset = 1+sin(current_time/(100/6)/game_get_speed(gamespeed_fps)*3);
	//var _size_pixel_ratio = 1/(sprite_get_bbox_bottom(spr_witch)- sprite_get_bbox_top(spr_witch));

	//draw_sprite_ext(spr_witch_head,0,_xx,_yy+_head_bop_offset,1,1,0,c_white,1);
	//draw_sprite_ext(spr_witch_hair,hair_image,_xx,_yy+_head_bop_offset,1,1,0,hair_color,1);
	//draw_sprite_ext(spr_witch_body,0,_xx,_yy,1,1,0,c_white,1);
	//draw_sprite_ext(spr_witch_dress,dress_image,_xx,_yy,1,1+_size_pixel_ratio*(0.5-_head_bop_offset),0,dress_color,1);
	//draw_sprite_ext(spr_witch_hat,hat_image,_xx,_yy+_head_bop_offset,1,1,0,hat_color,1);

	//_xx += 128;
	//_yy -= 128;
	
	//var i = 0;
	//repeat 3
	//{
		
	//	i++;
	//	_yy += 128;
	//}
}