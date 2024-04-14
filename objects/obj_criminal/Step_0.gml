/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

if(speed != 0)
{
	if(place_meeting(x,y,obj_cage))
		speed = 0;
}

if(x > room_width+sprite_width*2 and summon_delay == noone)
	id.summon(obj_cage.x,obj_cage.y,0);