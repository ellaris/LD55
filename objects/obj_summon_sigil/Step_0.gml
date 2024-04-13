/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if (delay <= 0)
{
	y -= raise*anim_speed;
	life -= 1;
	if(image_alpha > 0.5)
	{
		image_alpha -= anim_speed/2;
		image_xscale -= anim_speed/2;
		image_yscale -= anim_speed/2;
	}
}
else
	delay -= 1;

image_angle	+= spin_side * (360*anim_speed)

if(life <= 0)
	instance_destroy();


//show_debug_message(string(delay) + " - " + string(life) )