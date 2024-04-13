/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_set_font(fnt_default);

pattern_surface = surface_create(128,128);
draw_pattern = true;
pattern_style = irandom(sprite_get_number(spr_pattern)-1);

pattern_sx = 160;
pattern_sy = 160;
pattern_size = 0;

current_step = 0;

messagebox_x = room_width-128-12;
messagebox_y = 0+32;
inactivity = 0;
inactivity_treshold = game_get_speed(gamespeed_fps)*10;
step_messages = [
"Welcome young witch, you will be summoning a familial familiar, it's not just an ordinary familiar, it will become part of your family, so get ready",
"First we will need to draw a summoning sigil, summon some chalk and start drawing (left click on the summoning carpet, follow the template, fill 90% of the template and keep above 90% accuracy)",
"Good job, now lets summon those candles above the fire place into our sigil (left click an object to select, right click to summon it to mouse position)",
"Looks like some candles fell over, they do that sometimes, resummon them in correct position",
"Great, the summoning requires 15 gold pieces as sacrifice, I believe you got those in the bag you left beside the fireplace",
"Ah, those bouncy coins, it's harder to summon things you can't see, make sure they're all inside",
"Now, summon some herbs, they're above the fireplace",
"What was that red herring doing amongst the herbs, we don't want it inside our sigil, so just burn it",
"Fantastic, now we just need to light the candles, use the fireplace",
"Finally, the ritual requires 1 hour of casting, let's just cut to the end",
"Oh, a criminal! quickly, summon him inside the cage!",
"The court house is right next door, and their drawing ability is rater poor, so sometimes the crimilans get summoned here instead, but don't worry, your familiar is coming",
"Wow, what a great familiar"
]

calculate_similarity = function(_surface_add, _surface_subtract)
{
	var _s_temp = surface_create(128,128);
	var _similarity = 0;
	surface_set_target(_s_temp);
	
	if(_surface_add != noone)
		draw_surface(_surface_add,0,0);
	
	gpu_set_blendmode(bm_subtract);
	
	if(_surface_subtract != noone)
		draw_surface(_surface_subtract,0,0);
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
			
	//draw_surface(_s_temp,mouse_x,mouse_y);
			
	var _buffer = buffer_create(128*128*4, buffer_fixed, 1);
	buffer_get_surface(_buffer, _s_temp, 0);
	var i = 0;
	repeat 128*128
	{
		//var _red = buffer_peek(_buffer, i+1, buffer_u8);
		//var _green = buffer_peek(_buffer, i+2, buffer_u8);
		//var _blue = buffer_peek(_buffer, i+3, buffer_u8);
		var _alpha = buffer_peek(_buffer, i+0, buffer_u8);
		i += 4;
		if(_alpha != 0)
		{
			_similarity += 1
			//if(mouse_check_button(mb_left))
			//	show_debug_message(string(_red)+" "+string(_green) + " "+string(_blue)+ " " +string(_alpha))
		}
	}
	buffer_delete(_buffer);
	surface_free(_s_temp);
			
	return(_similarity)
}
