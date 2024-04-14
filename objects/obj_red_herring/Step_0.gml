/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

if(place_meeting(x,y,obj_fire) or place_meeting(x,y,obj_fireplace))
{
	repeat 8
		part_particles_create(obj_control.part_sys,x+irandom(sprite_width/2)-sprite_width/4,bbox_bottom,obj_control.part_type_fire,1);

	audio_play_sound(snd_fire, 3, false);
	instance_destroy();
}