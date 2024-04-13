/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

lit = false;
side_way = false;

image_xscale = choose(1,-1);

fall = function()
{
	if(irandom(2) == 0)
		side_way = true;
	else
		side_way = false;
	
	if(side_way)
		image_angle = choose(90,180);
	else
		image_angle  = 0;
}

teleport_callback = fall;