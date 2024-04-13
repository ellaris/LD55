/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(room == rm_witch_hut)
{
// draw message
	var _message = step_messages[current_step];
	var _padding = 12;
	var _mh = string_height_ext(_message,font_height,messagebox_width-_padding*2);
	
	
	draw_sprite_stretched(spr_messagebox,0,messagebox_x,messagebox_y,messagebox_width,_mh+_padding*2)
	
	draw_text_ext(messagebox_x+_padding,messagebox_y+_padding,_message,font_height,messagebox_width-_padding*2);
	
	//show_debug_message(string(view_get_wport(0)-128) + " " +string(view_get_hport(0)-64)+ " " + string(view_current))
	if(draw_pattern)
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
			
}
