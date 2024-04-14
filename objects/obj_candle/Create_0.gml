/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod





// Inherit the parent event
event_inherited();

lit = false;
side_way = false;

image_xscale = choose(1,-1);

fall = function()
{
	if(irandom(1) == 0 and not side_way)
		side_way = true;
	else
		side_way = false;
	
	if(side_way)
		image_angle = choose(90,270);
	else
		image_angle  = 0;
		
	if(lit)
		obj_control.recalculate_lighting();
}

teleport_callback = fall;