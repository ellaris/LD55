/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


offset -= 8;


if(offset <= 0)
{
	with obj_skeleton
		if(place_meeting(x,y,other))
			instance_destroy();
	instance_destroy();	
}

