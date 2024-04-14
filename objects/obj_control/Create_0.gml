/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

randomize();

audio_group_load(audiogroup_sfx);

music_volume = 0.5;
sound_volume = 0.8;

update_volume();

witch_palette = [c_black, c_dkgrey, #03045E, #023E8A, #0077B6, #0096C7, #00B4D8, #48CAE4, #90E0EF, #ADE8F4, #CAF0F8, c_white]

hat_image = irandom(sprite_get_number(spr_witch_hat)-1);
dress_image = irandom(sprite_get_number(spr_witch_dress)-1);
hair_image = irandom(sprite_get_number(spr_witch_hair)-1);

hat_sprite = spr_witch_hat
dress_sprite = spr_witch_dress
hair_image = spr_witch_hair

hat_color = array_shuffle(witch_palette)[0];
dress_color = array_shuffle(witch_palette)[0];
hair_color = array_shuffle(witch_palette)[0];

//list_music = [snd_music_battle,snd_music_main]
//list_sound = [snd_button_click,snd_button_hover,snd_coin_bounce,snd_end,snd_fire,snd_meteor_hit,snd_meteor_summon,snd_sigil,snd_skeleton_die,snd_summon]

draw_set_font(fnt_default);
gm_speed = game_get_speed(gamespeed_fps);
pattern_surface = surface_create(128,128);
draw_pattern = true;
draw_cd = gm_speed*2;
pattern_style = irandom(sprite_get_number(spr_pattern)-1);

pattern_sx = 160;
pattern_sy = 160;
pattern_size = 0;

psw = surface_get_width(pattern_surface);
psh = surface_get_height(pattern_surface);
psx_c = pattern_sx + psw/2;
psy_c = pattern_sy + psh/2;

pattern_fullness = 0;
pattern_score = 0;

last_refresh = 0;
left_click_timer = 0;
left_clicked = false;

is_mobile = os_type == os_android;
if(is_mobile)
{
	view_set_wport(0,480);
	view_set_hport(0,260);
}

current_step = 0;

summoned_herring = false;

messagebox_width = 128*2;
font_height = font_get_size(fnt_default)+5;
messagebox_x = view_get_wport(view_current)-messagebox_width-18; 
messagebox_y = 0+32;
inactivity = 0;
inactivity_cap = gm_speed*8;
inactivity_treshold = game_get_speed(gamespeed_fps)*10;
step_messages = [
"Welcome young witch, you will be summoning a familial familiar, it's not just an ordinary familiar, it will become part of your family, so get ready (wait)",
"First we will need to draw a summoning sigil, just start drawing (left click on the summoning carpet, follow the template outline, reach 90% fullness and keep your accuracy above 90%)",
"Good job, now lets summon those candles above the fire place into our sigil (left click an object to select it, white outline, right click anywhere to summon the selected object to the mouse position)",
"Looks like some candles fell over, they do that sometimes, resummon them in correct position",
"Great, the summoning requires 15 gold pieces as sacrifice, I believe you got those in the bag of yours",
"Ah, those bouncy coins, it's harder to summon things you can't see, make sure they're all inside",
"Oh, your credit card, you don't want to lose that, better summon it into your pocket",
"Now, summon some herbs, they're above the fireplace",
"What was that red herring doing amongst the herbs, we don't want it inside our sigil, so just burn it",
"Fantastic, now we just need to light the candles, use the fireplace",
"Finally, the ritual requires 1 hour of casting, let's just cut to the end (wait)",
"Oh, a criminal! quickly, summon him inside the cage!",
"The court house is right next door, and their drawing ability is rather poor, so sometimes the crimilans get summoned here instead, but don't worry, your familiar is coming (wait)",
"Wow, what a great familiar, you have betten the game! If you would care to take him out for a spin just (wait)",
"Maou-sama has summoned an army of skeletons, your familiar needs to fend them of by summoning meteors (left click) or their swarms (right click) (move with W S A D), you need to stall them for 1 minute until the white wizard Randalf gets here with his raiders, beware for whenever you defeat an enemy 2 more will be summoned in its place! (wait)"
]

if( is_mobile)
	step_messages[2] = "Good job, now lets summon those candles above the fire place into our sigil (click an object to select, double click to summon it to that position)"



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

function point_in_pattern(_px, _py){
	 return point_in_rectangle(_px,_py,psx_c-psw/2,psy_c-psh/2,psx_c+psw/2,psy_c+psh/2)
}

next_step = function(){
	current_step++;
	audio_play_sound(snd_button_hover,3,false);
	
	inactivity_cap = 0;
	switch(current_step)
	{
		case 10:
			inactivity_cap = gm_speed*6;
		break;
		case 12:
			inactivity_cap = gm_speed*10;
		break;
		case 13:
			inactivity_cap = gm_speed*7;
		break;
		case 14:
			inactivity_cap = gm_speed*16;
		break;
		
	}
}

step_initial_explanation = function(){
	if(inactivity >= game_get_speed(gamespeed_fps)*8)
		next_step();
}

step_draw_circle = function(){
	if(pattern_fullness >= 0.9 and pattern_score >= 0.9 or is_mobile)
	{
		next_step();
		draw_pattern = false;
		
	}
}

step_summon_candles = function(){
	var _inside = true;
	with obj_candle
		if not other.point_in_pattern(x,y)
		{
			_inside = false;
		}
		
	if(_inside)
		next_step();
}

step_stand_candles = function(){
	var _stand_inside = true;
	with obj_candle
		if (not other.point_in_pattern(x,y) or side_way)
		{
			_stand_inside = false;
		}
		
	if(_stand_inside)
		next_step();
}

step_gold_coins = function(){
	var _inside = true;
	if(instance_number(obj_coin) < 15)
		_inside = false
		
	if(_inside)
		next_step();
}

step_gold_coins_inside = function(){
	var _inside = true;
	with obj_coin
		if not other.point_in_pattern(x,y)
			_inside = false;
				
	if(_inside)
		next_step();
}

step_credit_card = function(){
	if(not instance_exists(obj_credit_card))
		next_step();
}

step_herbs_inside = function(){
	var _inside = true;
	with obj_herb
		if not other.point_in_pattern(x,y)
			_inside = false;
				
	if(_inside)
		next_step();
}

step_red_herring = function(){
	if(not instance_exists(obj_red_herring))
		next_step();
}

step_light_candles = function(){
	var _lit = true;
	with obj_candle
		if not lit
		{
			_lit = false;
		}
		
	if(_lit)
		next_step();
}

step_1h_wait = function(){
	if(inactivity >= game_get_speed(gamespeed_fps)*6)
		next_step();
}

step_criminal = function(){
	if(instance_exists(obj_criminal) and obj_criminal.speed == 0)
		next_step();
}

step_courthouse_explanation = function(){
	if(inactivity >= game_get_speed(gamespeed_fps)*10)
	{
		next_step();
		inactivity = 0;
	}
}

step_familiar_explanation = function(){
	if(inactivity >= game_get_speed(gamespeed_fps)*7)
	{
		next_step();
		inactivity = 0;
	}
}

step_minigame_explanation = function(){
	if(inactivity >= game_get_speed(gamespeed_fps)*16)
	{
		next_step();
		inactivity = 0;
		room_goto(rm_arena);
	}
}

step_advancement = [
	step_initial_explanation,
	step_draw_circle,
	step_summon_candles,
	step_stand_candles,
	step_gold_coins,
	step_gold_coins_inside,
	step_credit_card,
	step_herbs_inside,
	step_red_herring,
	step_light_candles,
	step_1h_wait,
	step_criminal,
	step_courthouse_explanation,
	step_familiar_explanation,
	step_minigame_explanation,
]

surface_lighting = surface_create(view_get_wport(0), view_get_hport(0));

music_track = audio_play_sound(snd_music_main,4,true)

// particles

part_sys = part_system_create();

part_type_wand_magic = part_type_create();
part_type_life(part_type_wand_magic,gm_speed/4,gm_speed/2);
part_type_direction(part_type_wand_magic,-45,45,0,0.5);
part_type_speed(part_type_wand_magic,0.5,0.8,0,0.1);
part_type_color2(part_type_wand_magic,c_aqua,c_white);
part_type_size(part_type_wand_magic,1,2,-0.01,0);

part_type_fire = part_type_create();
part_type_life(part_type_fire,gm_speed*0.8,gm_speed*1.2);
part_type_direction(part_type_fire,90-30,90+30,0,1);
part_type_speed(part_type_fire,0.5,1.0,0,0.01);
part_type_gravity(part_type_fire,0.01,270);
part_type_color3(part_type_fire,c_blue,c_aqua,c_white);
part_type_size(part_type_fire,0.5,2,-0.01,0.02);


part_type_summon_magic = part_type_create();
part_type_life(part_type_summon_magic,gm_speed/3,gm_speed/2);
part_type_direction(part_type_summon_magic,90-10,90+10,0,0);
part_type_speed(part_type_summon_magic,1.0,1.2,0,0);
part_type_color2(part_type_summon_magic,c_aqua,c_blue);
part_type_size(part_type_summon_magic,1,1.2,-0.01,0);