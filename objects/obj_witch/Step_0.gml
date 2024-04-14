/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(wand_image != 0)
	rest += 1;
if(rest >= game_get_speed(gamespeed_fps)/2)
{
	if(wand_image == 2)
	{
		wand_image = 1;
		rest = 0;
	}
	else
	{
		wand_image = 0;
		rest = 0;
	}
}

head_bop++

if(room == rm_main)
{
	if(irandom(obj_control.gm_speed*3) == 0)
	{
		wand_image = 1+irandom(1);
		repeat 6
			part_particles_create(obj_control.part_sys,x-sprite_width/2+irandom(sprite_width),bbox_bottom,obj_control.part_type_summon_magic,1);
	}

	if(not point_in_rectangle(x,y,0,0,room_width,room_height))
		instance_destroy();
	
}
