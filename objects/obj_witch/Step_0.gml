/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(image_index != 0)
	rest += 1;
if(rest >= game_get_speed(gamespeed_fps))
{
	if(image_index == 2)
	{
		image_index = 1;
		rest = 0;
	}
	else
	{
		image_index = 0;
		rest = 0;
	}
}

