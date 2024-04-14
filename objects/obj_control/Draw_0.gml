/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod




if(room == rm_witch_hut)
{
	//draw_sprite(spr_carpet,0,pattern_sx,pattern_sy);
	if(not surface_exists(pattern_surface))
		pattern_surface = surface_create(128,128);
	if(draw_pattern )
	{
		//draw_sprite_ext(spr_pattern,pattern_style,pattern_sx,pattern_sy,1,1,0,0,0.5);
		var _refresh = current_time div 1000;
		if((os_browser == browser_not_a_browser or _refresh > last_refresh) and not is_mobile)
		{
			last_refresh = _refresh;
			var _dps = surface_create(128,128);
				surface_set_target(_dps)
				draw_sprite(spr_pattern,pattern_style,0,0)
				surface_reset_target();
	
				var _pattern_size = pattern_size;
				if(pattern_size == 0)
				{
					 _pattern_size = calculate_similarity(_dps, noone);
					 pattern_size = _pattern_size;
				}
			
				var _pattern_fill = calculate_similarity(_dps, pattern_surface);
				var _pattern_outside = calculate_similarity(pattern_surface, _dps);
			
				surface_free(_dps);
			
				var _fr = abs(_pattern_fill-_pattern_size)/_pattern_size;
				var _mr = ((_pattern_outside-(_pattern_size-_pattern_fill))/_pattern_size)/2;
			
				var _score = 1-_mr/2;
	
				//show_debug_message(string("{0} {1} {2} {3} {4} {5}", _pattern_size,_pattern_fill,_pattern_outside, _fr, _mr,_score )  )
				//show_debug_message(string("finished: {0}, error: {1}, fail: {2}", _fr > 0.9, _mr > 0.2, _score < 0.9))
			
				pattern_fullness = _fr;
				pattern_score = _score;
			
				//draw_text(room_width-128, room_height-64, string("Fullness: {0}%\nAccuracy: {1}%", round(_fr*100), round(_score*100)));
			
				if(_fr >= 0.9 and _score >= 0.9)
					draw_pattern = false;
		}
		
		if(pattern_score < 0.9)
		{
			surface_set_target(pattern_surface);
			draw_clear_alpha(c_black,0);
			surface_reset_target();
			draw_cd = gm_speed*2;
		}
	}
	
	//draw_surface(pattern_surface,pattern_sx,pattern_sy);
	
	if(mouse_check_button(mb_left) and not draw_cd)
		if(draw_pattern and point_in_rectangle(mouse_x, mouse_y, pattern_sx, pattern_sy,
			pattern_sx+surface_get_width(pattern_surface), pattern_sy+surface_get_height(pattern_surface)))
		{
			inactivity = 0;
			surface_set_target(pattern_surface);
			draw_circle(mouse_x-pattern_sx,mouse_y-pattern_sy,3,false);
			surface_reset_target();
			
		}
	
	//draw_text(mouse_x,mouse_y,string(is_mobile))
}
