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
